
# Gem para consumir Web Services. Se usa para consumir WS del GPS
require 'savon'
 
module GpsHelper
  
  GPS_RETIRE_REASON_GPS_CHANGE = 1
  GPS_RETIRE_REASON_GPS_NOT_FOUND = 2
  
  
  # Devuelve la descripcion de un motivo de retiro de gps
   
  def gps_h_get_retire_desc(reason)
    
    case reason 
    when GPS_RETIRE_REASON_GPS_CHANGE  
      desc = "Cambio datos GPS"
      
    when GPS_RETIRE_REASON_GPS_NOT_FOUND     
      desc = "GPS no encontrado"
    else
      desc = "? (" + reason.to_s  + ")"
    end
    
    return desc 
  end
  
  
  # Devuelve un objeto cliente para consumir los metodos del web service.
  
  def gps_h_get_client
    gps_client = Savon.client(wsdl: ENV['gps_ws_url'], 
        endpoint: ENV['gps_ws_endpoint']);
        
    return gps_client;      
  end
    
  
  #  Compara Moviles GPS devueltos por el WS de GPS con los registrados en el sistema
  
  def gps_h_compare_gps_installations
   gps_client = gps_h_get_client;
   gps_client.operations.to_s         
   
   
   #  Obtener los moviles con gps del servicio de GPS y cargarlos en variable compartida
   
   #  La comparacion con los datos del sistema se hace en la pagina html
   
   response = gps_client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
   
   @wsdata=response.body[:consultar_moviles_flota_response][:return] 
  
  end
  
  
  
  #  Crea Vehiculos a partir de dispositivos gps ya registrados en el sistema, 
  #  que no tengan un Vehiculo asociado 
  
  def gps_h_create_vehicles
   
      @msgs = ""
   
   
      gps_installations = GpsInstallation.where('active=true')


      gps_installations.each do |g|
       
        if g.vehicle_id == nil
          
          vehic = gps_h_create_vehicle_from_gps_inst(g)
          
          if vehic != nil 
            g.vehicle_id = vehic.id
            g.save
             
          end
        end
                
      end
     
  end
  
  
  # Actualiza las posiciones de todos los vehículos.
  # Se invoca desde 
  
  def gps_h_update_vehicle_positions
  
      ## Inicializar  cliente web service

      gps_client = gps_h_get_client;
      gps_client.operations.to_s

      ## Actualizar posicion de vehiculos en la bd


      gps_installations = GpsInstallation.where('active=true')

      gps_installations.each do |g|
        gps_h_save_last_position gps_client, g
      end
     
  end
  
  
  
  def gps_h_save_last_position (gps_client, gps_installation) 
     
     ## Inicializar variables
     
     # Identificador del dispositivo
     gps_numeric_ident = gps_installation.gps_numeric_ident
     # Ultima posicion 
     last_pos = nil
          
     # Obtener lectura mas reciente de posicion del vehiculo en la base
     last_pos = GpsVehiclePosition.where('gps_numeric_ident=?', gps_installation.gps_numeric_ident).order('gps_datetime desc').first  
       
     
     begin
       
        ##  Obtener ultima posicion consultando WebService del GPS
        response=gps_client.call(:consultar_ultima_posicion, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'], 'movil_id' => gps_numeric_ident })
        wsdata=response.body[:consultar_ultima_posicion_response][:return]
    
        if wsdata
    
          longitud = wsdata[:longitud].to_f 
          latitud = wsdata[:latitud].to_f
          fecha_mens = wsdata[:fecha_mensaje].to_time
          
          
          ##  Crear un nuevo registro solo si es distinto al ultimo almacenado
          
          crear = true
          if last_pos != nil           
            if ! (latitud != last_pos.gps_latitude || longitud != last_pos.gps_longitude)
              crear = false
            end
          end
            
          if crear           
            
            ##  Crear objeto posicion
                      
            gps_v_pos = GpsVehiclePosition.new
                      
            # Guardar id de la configuracion de gps actual (id_numerico, descripcion, matricula)          
            gps_v_pos.gps_installation_id = gps_installation.id
           
                      
            ##  Datos devueltos por el WS
            
            gps_v_pos.gps_longitude=longitud
            gps_v_pos.gps_latitude=latitud
            
            gps_v_pos.gps_datetime=fecha_mens
            
            
            gps_v_pos.gps_direction = wsdata[:sentido]                    
            gps_v_pos.gps_speed = wsdata[:velocidad]
            
            
            ##  Guardar datos de identificacion del gps
                 
            gps_v_pos.gps_numeric_ident = wsdata[:movil_id]
            gps_v_pos.gps_descriptive_ident = wsdata[:identificador]
            
           
            gps_v_pos.save
          end 
        end
        
      rescue Savon::Error => soap_fault
        puts "ERROR: #{soap_fault}\n"
      end
      
  end
            
 
 def gps_h_save_odometer_readings_tmp
    begin
      gps_client = gps_h_get_client;
      gps_client.operations.to_s

      response=gps_client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })

      wsdata=response.body[:consultar_odometro_flota_response][:return]

      wsdata.each do |data|
        
       readings = VehicleOdometerReading.where("gps_numeric_ident = ?", data[:movil_id]).order("gps_datetime desc")
     
       reading_ant = nil
       readings.each do |reading|
         
         if reading_ant != nil 
           reading_ant.difference = reading_ant.gps_total_read - reading.gps_total_read
           reading_ant.save
         end
         
         reading_ant = reading
       end
     
       reading_ant.difference = 0
       reading_ant.save
       
    #   fecha_gps = data[:fecha_gps].to_datetime
       
       
       
#       if reading != nil
#         data[:dif_dt] = (reading.gps_datetime.to_i - fecha_gps.to_i).abs
#       end
        
#       data [:result_busqueda_id] = reading.gps_numeric_ident
#       data [:result_busqueda_dt] = reading.gps_datetime.to_s   
#       data [:result_busqueda_pr] = reading.gps_partial_read.to_s   
 
      end

      return wsdata

    rescue Savon::Error => soap_fault
      puts "ERROR: #{soap_fault}\n"
    end
  end
  
 
 def gps_h_save_odometer_readings
    begin
      
      # Consulta el ws y descarga las lecturas de odometro de los vehiculos 
      
      gps_client = gps_h_get_client;
      gps_client.operations.to_s 
                      
      response=gps_client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
      wsdata=response.body[:consultar_odometro_flota_response][:return]

      
      # Recorrer datos de lecturas devueltas por el WS, se devuelve una para cada dispositivo GPS instalado

      wsdata.each do |data| 
        
          # ----  para debug  ----
                 
          data[:gps_installation_id] = nil
          data[:vehicle_id] = nil          
          data[:reading_saved] = ""
          data[:last_datetime] = ""
          
          # ----  fin debug  ----
          
        
        # Flag para indicar si se debe crear el registro
        crear_registro=true
        
        gps_inst = nil
        last_reading = nil
        
        # Buscar en la base local instalacion GPS asociada al identificador que se esta procesando        
        gps_inst = GpsInstallation.where(["gps_numeric_ident = ? AND active = true ", data[:movil_id]] ).first
                   
                  
                   
        if  gps_inst != nil
        
          # ----  debug  ----
          
            # ----  para debug  ----
                 
            data[:gps_installation_id] = gps_inst.id
            data[:vehicle_id] = gps_inst.vehicle_id
            data[:gps_inst_desc] = gps_inst.gps_descriptive_ident
          
            # ----  fin debug  ----
            
               
               
               
          # Obtener lectura anterior, para determinar si hay cambios                    ------------------ >   CREAR INDICE ??
                    
          last_reading = GpsOdometerReading.where(["gps_numeric_ident = ? AND gps_installation_id = ?", gps_inst.gps_numeric_ident, gps_inst.id ]).order("gps_datetime desc").first
          
          if last_reading != nil          
            
            # ----  info para mostrar  ----  
            data[:last_reading] = last_reading.gps_partial_read.to_s             
            data[:last_datetime] = last_reading.gps_datetime.to_s
            data[:difference] =  data[:odometro_total].to_i - last_reading.gps_total_read
            data[:info_last_reading] = "parcial: " + last_reading.gps_partial_read.to_s + " - " + data[:odometro_parcial] + " , total: " + last_reading.gps_total_read.to_s + " - " + data[:odometro_total]
          
            # ----  info para mostrar  ----
            
            if (last_reading.gps_partial_read == data[:odometro_parcial].to_i) && (last_reading.gps_total_read == data[:odometro_total].to_i) 
              
              data[:info_last_reading] = data[:info_last_reading] + " (no crear) "
             
             
              crear_registro = false
            end               
          end                                        
        end 
        
        
        # Si no habia lectura anterior para la instalacion gps asociada, o si la misma tiene valores diferentes
        # se crea el registro con la lectura actual
        
        if crear_registro
           
          odom_reading = GpsOdometerReading.new
    
          fecha_gps = data[:fecha_gps].to_datetime
          odom_reading.gps_datetime = fecha_gps 
          odom_reading.gps_numeric_ident = data[:movil_id]
          odom_reading.gps_plate_number = data[:patente]
          odom_reading.gps_descriptive_ident = data[:identificador]
          odom_reading.gps_partial_read = data[:odometro_parcial].to_i
          odom_reading.gps_total_read = data[:odometro_total].to_i
          
           
          # Si se encontro instalacion gps definida en la base, asociar la lectura a la misma 
          if gps_inst != nil

            odom_reading.gps_installation_id = gps_inst.id  
            
            # calcular diferencia con la lectura anterior
            
            if last_reading != nil 
              odom_reading.difference = odom_reading.gps_total_read - last_reading.gps_total_read
            else 
              odom_reading.difference = 0       
            end 
          end  
  
  
          #  Guardar el registro 
          
          data[:reading_saved] = "1"  
          odom_reading.save   
 
        end  # if crear_registro
  
        
      end  # each do

    return wsdata

    rescue Savon::Error => soap_fault
      puts "ERROR: #{soap_fault}\n"
    end
  end


 

=begin
  
  
  def gps_h_create_from_gps_data
   gps_client = gps_h_get_client;
   gps_client.operations.to_s         
   
   # parametro recibido por url
   gps_id = params[:gps_numeric_ident] 
   
   
   response = gps_client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
      
   @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
   @wsdata.each do |data|  
     
     if data[:movil_id] == gps_id
        vehic = Vehicle.where(["gps_numeric_ident = ?", data[:movil_id]]).first 
      
        if ! vehic.nil?
           
          vehic.gps_numeric_ident = ""
          vehic.save
        end
                  
        vehic = Vehicle.new
        vehic.brand = "marca"
        vehic.model = "modelo" 
        vehic.plate_number = data[:patente] 
        vehic.comments = data[:identificador] 
        vehic.gps_numeric_ident = data[:movil_id]
        vehic.gps_plate_number = data[:patente]
        vehic.gps_description = data[:identificador]
        vehic.company_id = 1
        vehic.vehicle_type_id = 1
        vehic.vehicle_brand_id = 1
        
       
        if ! vehic.valid?
          
          @msgs =  "No se guardó el vehículo " + data[:movil_id] + " PATENTE: " + vehic.plate_number + "<br>"
          
          vehic.errors.each do |err|
              @msgs = @msgs + err.to_s + "; "
          end
          
          
        else
          vehic.save
          @msgs =  "Guardado "  + data[:movil_id] + " PATENTE: " +  vehic.plate_number + "<br>"
        end       
      end
      
    end
        
    redirect_to '/vehicles/update_vehicles_gps_data'   
  end
  
=end
  ##
  
  

  ## Actualiza las configuraciones de gps (id, descripcion, matricula)
    
  def gps_h_update_gps_installations
     
    gps_client = gps_h_get_client;
    gps_client.operations.to_s     
   
    ##  LLamada al web service , obtener info de vehiculos y gps    
   
    response = gps_client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
   
    # Obtengo datos de instalaciones gps y comparo con los datos que ya tengo.
    # Los datos de instalaciones nuevas se almacenan como GpsInstallations. 
    
    @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
    @wsdata.each do |data|  
      # Buscar instalacion gps por numeric ident de gps
      
      movilId = data[:movil_id]
         
      gps_inst = GpsInstallation.where(["gps_numeric_ident = ? and active=true", movilId]).first   
      create_gps_inst = false
       
      if gps_inst != nil 
        
        #  Si existen datos de gps para ese id, pero tienen distinta matricula o descripcion
        #  marcar la instalacion actual como "retirada" y setear flag para crear nueva instalacion
        
        if gps_inst.gps_plate_number != data[:patente] || gps_inst.gps_descriptive_ident != data[:identificador] 
          
          # Marcar la instalacion como retirada por cambio en configuracion GPS    
          gps_h_retire_gps_installation(gps_inst, GPS_RETIRE_REASON_GPS_CHANGE)
                         
          # Indicar que se debe crear un nuevo registro 
          create_gps_inst = true
        end
          
      else
      
        # No había registro para el gps actual , se debe crear un nuevo registro
        create_gps_inst = true
      end
       
      
      # se debe crear una nueva GpsInstallation si 
      # a) se encontro una instalacion con diferencias en los datos para el mismo identificador 
      # b) no existian datos para la instalacion actual
      if create_gps_inst  
        
        # crear GpsInstallation 
        new_gps_inst = gps_h_create_gps_installation(data)   
      
        # registrar un GpsChange (gps_inst es nil si estoy en el caso b)
        gps_change = gps_h_create_gps_change(gps_inst, new_gps_inst)
              
      end 
      
    end  # fin recorrida de instalaciones gps
    
  end 
       
  
  
  # Marca una GpsInstallation como inactiva.  
  def gps_h_retire_gps_installation (gps_inst, retirement_reason)

    gps_inst.retirement_reason = retirement_reason 
    gps_inst.retirement_date = DateTime.current      
    
    gps_inst.active = false
    gps_inst.save
  end
  
  
  # Crea un objeto GpsInstallation a partir de los datos devueltos por el Web Service.  
  def gps_h_create_gps_installation (gps_data)
    
    gps_inst = GpsInstallation.new
    
    # Identificacion del gps y del vehiculo
    
    gps_inst.gps_numeric_ident = gps_data[:movil_id]
    gps_inst.gps_plate_number = gps_data[:patente]  
    gps_inst.gps_descriptive_ident = gps_data[:identificador]  
    
    gps_inst.creation_date = DateTime.current
    
    gps_inst.active = true
    
    gps_inst.save 
     
    return gps_inst
  end
  
   
  # Crea un objeto GpsChange para reflejar un cambio en una instalacion de gps existente
  # o una nueva incorporacion.  
  def gps_h_create_gps_change (gps_prev_inst, gps_inst) 
    gps_change = GpsChange.new
    
    gps_change.date_changed = DateTime.current  
    gps_change.gps_installation_id = gps_inst.id  # guardar id de dispositivo gps actual
    
    # Caso en que se modifica una instalacion existente
    if gps_prev_inst != nil        
        gps_change.gps_prev_installation_id = gps_prev_inst.id     # guardar id de dispositivo gps anterior      
    end
    
    gps_change.pending = true
    gps_change.save  
    
    return gps_change
  end
  
  
  
  # -- DEPRECATED --
  # Crea un GpsRetiredVehicle a partir de un GpsInstallation. 
  # Devuelve el objeto creado.
  def depr_gps_h_create_gps_retired_v (gps_inst, retirement_reason)

    gps_retired = GpsRetiredVehicle.new

    gps_retired.original_gps_installation_id = gps_inst.id
    gps_retired.gps_numeric_ident = gps_inst.gps_numeric_ident
    gps_retired.gps_plate_number = gps_inst.gps_plate_number
    gps_retired.gps_descriptive_ident = gps_inst.gps_descriptive_ident
    gps_retired.retirement_date = DateTime.current    
    gps_retired.creation_date = gps_inst.creation_date
    gps_retired.vehicle_id = gps_inst.vehicle_id
    
    gps_retired.retirement_reason = retirement_reason

    return gps_retired
  end 
  
  
  # Crea un Vehicle a partir de un GpsInstallation. 
  # Devuelve el objeto creado.
  def gps_h_create_vehicle_from_gps_inst (gps_inst)
    
    vehic = Vehicle.new
    
    vehic.model = "modelo"
    
    vehic.gps_numeric_ident = gps_inst.gps_numeric_ident
    vehic.plate_number = gps_inst.gps_plate_number.strip
    vehic.comments = gps_inst.gps_descriptive_ident
    vehic.company_id = 1
    vehic.vehicle_type_id = 1
    vehic.vehicle_brand_id = 1
    
    vehic.creation_date = DateTime.current  
    vehic.status=2   # A validar

    @msgs = ""

    if ! vehic.valid?

      @msgs =  @msgs + "No se guardó el vehículo para GPS INSTALLATION ID: " + gps_inst.gps_numeric_ident + " Matricula: " +  gps_inst.gps_plate_number + "<br>"
 
      vehic.errors.each do |err|
        @msgs = @msgs + err.to_s + "; "
      end

      return nil
    else
      vehic.save
      @msgs =  @msgs + "Guardado vehículo para GPS INSTALLATION ID: "  + gps_inst.gps_numeric_ident + " Matricula " +  vehic.plate_number + "<br>"
      
      return vehic
    end

  end
  
  
  # Procesa un cambio de datos de gps que corresponde a un mismo vehiculo
  def gps_h_change_is_same_vehicle (gps_change)
    
    gps_installation = gps_change.gps_installation
    gps_prev_installation = gps_change.gps_prev_installation
     
    if gps_installation != nil  && gps_prev_installation != nil 
        
        gps_installation.vehicle_id = gps_prev_installation.vehicle_id
        
                
        # calcular diferencias en lecturas de odometros si es posible
        
        # primero obtener las ultimas lecturas que se encuentren sin diferencia calculada junto con la ultima diferencia calculada
        sql = "select * from gps_odometer_readings where vehicle_id = " + gps_inst.vehicle_id.to_s + " and created_at >=  (select max (or_int.created_at) from gps_odometer_readings or_int where or_int.vehicle_id = " + gps_inst.vehicle_id.to_s + " and not or_int.difference is null ) order by created_at"
        gps_odometer_reads = GpsOdometerReading.find_by_sql(sql)
        
        
        #  recorrer las lecturas y calcular la diferencia segun la lectura anterior
        last = nil
        gps_odometer_reads.each do |reading|
          if last != nil
            reading.difference = reading.gps_total_read - last.gps_total_read            
            reading.save
          end
          
        end
        
      end      
   end
   
  
  # Procesa un cambio de datos de gps que corresponde a un nuevo vehiculo
  def gps_h_change_is_new_vehicle (gps_change)
    
    gps_inst = gps_change.gps_installation
    gps_retired = gps_change.gps_prev_installation
    
    
    vehic = gps_h_create_vehicle_from_gps_inst(gps_inst)
    
    gps_inst.vehicle_id = vehic.id
    gps_inst.save
    
    
    # to do : Obtener posiciones y lecturas de odometro asociadas y asignar vehicle_id
    
    # recalcular diferencias entre lecturas odometro
    
  end 
  
  
  
  
  def gps_h_process_gps_changes () 
    
    @retired_vehics = []
    
    changes = GpsChange.all
    
    changes.each do |change| 
    
      gps_h_process_gps_change(change)
                  
    end
     
  end
  
  
  def gps_h_process_gps_change (gps_change) 
    # Procesa los registros de cambios de gps.
    # Dichos registros son generados cuando se detectan diferencias al actualizar los datos
    # de los dispositivos gps mediante el webservice correspondiente.
     
    gps_inst = gps_change.gps_installation  # datos dispositivo gps actual
    gps_prev_inst = gps_change.gps_prev_installation  # datos dispositivo gps anterior
     
    
    if gps_inst != nil &&  gps_prev_inst != nil
            
      # CASO MATRICULA y IDENTIFICADOR disintos
      if (gps_inst.gps_plate_number != gps_prev_inst.gps_plate_number) && (gps_inst.gps_descriptive_ident != gps_prev_inst.gps_descriptive_ident)
          
          retired_inst =  "[" + gps_prev_inst.gps_plate_number + "," + gps_prev_inst.gps_plate_number + "] -> ["  + gps_prev_inst.gps_plate_number + "," + gps_prev_inst.gps_plate_number + "]"
          @retired_insts << retired_inst
            
      end     
    end
     
  end
  
end

