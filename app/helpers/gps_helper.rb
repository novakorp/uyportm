
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
      desc = "?"
    end
    
    return desc
    
  end
  
  
  # Devuelve un objeto cliente para consumir los metodos del web service.
  
  def gps_h_get_client
    client = Savon.client(wsdl: ENV['gps_ws_url'], 
        endpoint: ENV['gps_ws_endpoint']);
        
    return client;      
  end
    
  
  #  Compara Moviles GPS devueltos por el WS de GPS con los registrados en el sistema
  
  def gps_h_compare_gps_vehicles
   client = gps_h_get_client;
   client.operations.to_s         
   
   
   #  Obtener los moviles con gps del servicio de GPS y cargarlos en variable compartida
   
   #  La comparacion con los datos del sistema se hace en la pagina html
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
   
   @wsdata=response.body[:consultar_moviles_flota_response][:return] 
  
  end
  
  
  
  #  Crea Vehiculos a partir de dispositivos gps ya registrados en el sistema, 
  #  que no tengan un Vehiculo asociado 
  
  def gps_h_create_vehicles
   
      @msgs = ""
   
   
      gps_vehicles = GpsVehicle.all


      gps_vehicles.each do |g|
       
        if g.vehicle_id == nil
          
          vehic = gps_h_create_vehicle_from_gps_vehic(g)
          
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

      @client = gps_h_get_client;
      @client.operations.to_s

      ## Actualizar posicion de vehiculos en la bd

      gps_vehicles = GpsVehicle.all

      gps_vehicles.each do |g|
        save_last_position @client, g
      end
     
  end
  
  
  
  def save_last_position (client, gps_vehicle) 
     
     gps_numeric_ident = gps_vehicle.gps_numeric_ident
     last_pos = nil
          
     ## Obtener ultima posicion del vehiculo en la base
     last_pos = GpsVehiclePosition.where('gps_numeric_ident=?', gps_vehicle.gps_numeric_ident).order('gps_datetime').last  
       
     
     begin
       
        ##  Obtener ultima posicion en WebService
        response=client.call(:consultar_ultima_posicion, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'], 'movil_id' => gps_numeric_ident })
   
        
        wsdata=response.body[:consultar_ultima_posicion_response][:return]
    
        longitud = wsdata[:longitud].to_f 
        latitud = wsdata[:latitud].to_f
        fecha_mens = wsdata[:fecha_mensaje].to_time
        
        
        ##  Crear un nuevo registro solo si es distinto al ultimo almacenado
        
        crear = true
        if last_pos != nil           
          if ! (latitud != last_pos.gps_latitude or longitud != last_pos.gps_longitude)
            crear = false
          end
        end
    
        
          
        if crear           
          ##  Crear objeto posicion
          
          gps_v_pos = GpsVehiclePosition.new
          
          
          # Guardar id de la configuracion de gps actual (id_numerico, descripcion, matricula)
          
          gps_v_pos.gps_vehicle_id = gps_vehicle.id
          
          
          
          ##  Datos devueltos por el WS
          
          gps_v_pos.gps_longitude=longitud
          gps_v_pos.gps_latitude=latitud
          
          gps_v_pos.gps_datetime=fecha_mens
          
          
          gps_v_pos.gps_direction = wsdata[:sentido]                    
          gps_v_pos.gps_speed = wsdata[:velocidad]
          
          
          ##  Guardar datos de identificacion del gps
               
          gps_v_pos.gps_numeric_ident = wsdata[:movil_id]
          gps_v_pos.gps_descriptive_ident = wsdata[:identificador]
          
          
          # Guardar id de vehiculo asociado
          
          gps_v_pos.vehicle_id=gps_vehicle.vehicle_id
         
          gps_v_pos.save
        end 
        
      rescue Savon::Error => soap_fault
        puts "ERROR: #{soap_fault}\n"
      end
      
  end
            
 
 def gps_h_save_odometer_readings_tmp
    begin
      client = gps_h_get_client;
      client.operations.to_s

      response=client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })

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
      client = gps_h_get_client;
      client.operations.to_s 
      
      response=client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
      wsdata=response.body[:consultar_odometro_flota_response][:return]

      wsdata.each do |data|
 
            
        fecha_gps = data[:fecha_gps].to_datetime   
        
        # Buscar el vehiculo asociado a este identificador de GPS
        gps_vehic = GpsVehicle.where(["gps_numeric_ident = ?", data[:movil_id]]).first
               
        if  gps_vehic != nil
                   
          odom_reading = GpsOdometerReading.new
          
          odom_reading.gps_datetime = fecha_gps 
          odom_reading.gps_numeric_ident = data[:movil_id]
          odom_reading.gps_plate_number = data[:patente]
          odom_reading.gps_descriptive_ident = data[:identificador]
          odom_reading.gps_partial_read = data[:odometro_parcial].to_i
          odom_reading.gps_total_read = data[:odometro_total].to_i
          
          
          # Guardar datos de identificacion del GPS y Vehiculo si se verifica los datos de gps coinciden con los de la base    
          odom_reading.gps_vehicle_id = gps_vehic.id 
          odom_reading.vehicle_id = gps_vehic.vehicle_id
                                         
          # obtener ultima lectura gps
          last_reading = GpsOdometerReading.where("gps_numeric_ident = ?", gps_vehic.gps_numeric_ident).order("gps_datetime desc").first
               
          # para debug
               
          data[:gps_vehicle_id] = gps_vehic.id
          data[:vehicle_id] = gps_vehic.vehicle_id 
           
           
          data[:reading_saved] = ""
          data[:last_datetime] = ""
           
          if last_reading != nil
              
            data[:last_reading] = last_reading.gps_partial_read.to_s
             
            data[:last_datetime] = last_reading.gps_datetime.to_s
            data[:difference] = (last_reading.gps_datetime.to_i - fecha_gps.to_i).abs.to_i
              
      #      if (last_reading.gps_datetime.to_i - fecha_gps.to_i).abs > 23 
                
              data[:reading_saved] = "1"
               
              odom_reading.difference = odom_reading.gps_total_read - last_reading.gps_total_read        
              odom_reading.save            
               
      #      end
          else              
              data[:reading_saved] = "1" 
               
              odom_reading.difference = nil 
              odom_reading.save            
          end 
        end
      end

    return wsdata

    rescue Savon::Error => soap_fault
      puts "ERROR: #{soap_fault}\n"
    end
  end


 

=begin
  
  
  def gps_h_create_from_gps_data
   client = gps_h_get_client;
   client.operations.to_s         
   
   # parametro recibido por url
   gps_id = params[:gps_numeric_ident] 
   
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
      
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
    
  def gps_h_update_gps_vehicles
   
    vehiclesFound = []
   
    client = gps_h_get_client;
    client.operations.to_s     
   
    ##  LLamada al web service , obtener info de vehiculos y gps    
   
    response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_username'], 'pass' => ENV['gps_ws_password'] })
   
    @info = []
      
    # Obtengo datos de vehiculos , y comparo con los datos que ya tengo.
    # Los datos de vehiculos nuevos se almacenan como GpsVehicles.
    # Si algun vehiculo tiene cambios, muevo los datos anteriores a la tabla de vehiculos retirados.
    
    @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
    @wsdata.each do |data| 
      
      
      # Buscar asociacion gps-vehiculo por id de gps
      
      movilId = data[:movil_id]
         
      gps_vehic = GpsVehicle.where(["gps_numeric_ident = ?", movilId]).first   
      create_gps_v = false
      
      
      if gps_vehic != nil 
        
        #  Si existen datos de gps para ese id, pero tienen distinta matricula o descripcion
        #  guardar la info del gps actual como "retirado" , cambiando el registro de tabla.
        
        if gps_vehic.gps_plate_number != data[:patente] || gps_vehic.gps_descriptive_ident != data[:identificador] 
          
          # Copiar los datos a la tabla de vehiculos retirados          
          gps_retired = gps_h_create_gps_retired_v(gps_vehic, GPS_RETIRE_REASON_GPS_CHANGE)           
          gps_retired.save
                              
                                
          # Luego de crear el registro en la tabla de gps retirados, borrar el registro original               
          
          gps_vehic.destroy
          
          # Indicar que se debe crear un nuevo registro
          
          create_gps_v = true
        end
        
      else
      
          # No había registro para el gps actual , se debe crear un nuevo registro
          
        create_gps_v = true
      end
      
      
      # Creacion de un nuevo registro
      
      if create_gps_v 
        gps_vehic = GpsVehicle.new
        
        # Identificacion del gps y del vehiculo
        
        gps_vehic.gps_numeric_ident = data[:movil_id]
        gps_vehic.gps_plate_number = data[:patente]  
        gps_vehic.gps_descriptive_ident = data[:identificador]  
           
        gps_vehic.save 
      
      
        # registrar un aviso de cambio de GPS
        
        gps_change = GpsChange.new
        gps_change.date_changed = DateTime.current 
        gps_change.gps_vehicle_id = gps_vehic.id
        
        gps_change.save
        
      
        if gps_retired != nil           
          
          # si ya habia otro gps con el mismo ident numerico  (o sea que se creo un GpsRetiredVehicle)
          # asignar el id en el registro de cambio
          
          gps_change.gps_retired_vehicle_id = gps_retired.id          
          gps_change.save
        
        else
          
          # si no habia otro gps con este identificador numerico crear un vehiculo
          vehic = gps_h_create_vehicle_from_gps_vehic gps_vehic
          
          gps_vehic.vehicle_id = vehic.id 
          gps_vehic.save
        end
        
      end
        
      vehiclesFound << gps_vehic.id
      
    end 
    
    # Marcar como retirados los gps_vehic que no estaban en la colección devuelta por el WS
    
    if vehiclesFound.size > 0
      vehicNF = GpsVehicle.where("id not in (" + vehiclesFound.join(",") + ")")
      
      vehicNF.each do |v| 
    
        # Copiar los datos a la tabla de vehiculos retirados          
        gps_retired = gps_h_create_gps_retired_v(v, GPS_RETIRE_REASON_GPS_NOT_FOUND)
        
        # Guardar datos copiados y eliminar datos anteriores
        gps_retired.save
        v.destroy
                  
      end
    end
  end 
  
  
  # Crea un GpsRetiredVehicle a partir de un GpsVehicle. 
  # Devuelve el objeto creado.
  def gps_h_create_gps_retired_v (gps_vehic, retirement_reason)

    gps_retired = GpsRetiredVehicle.new

    gps_retired.original_gps_vehicle_id = gps_vehic.id
    gps_retired.gps_numeric_ident = gps_vehic.gps_numeric_ident
    gps_retired.gps_plate_number = gps_vehic.gps_plate_number
    gps_retired.gps_descriptive_ident = gps_vehic.gps_descriptive_ident
    gps_retired.retirement_date = DateTime.current    
    gps_retired.creation_date = gps_vehic.creation_date
    gps_retired.vehicle_id = gps_vehic.vehicle_id
    
    gps_retired.retirement_reason = retirement_reason

    return gps_retired
  end 
  
  
  # Crea un Vehicle a partir de un GpsVehicle. 
  # Devuelve el objeto creado.
  def gps_h_create_vehicle_from_gps_vehic (gps_vehic)
    
    vehic = Vehicle.new
    
    vehic.model = "modelo"
    
    vehic.gps_numeric_ident = gps_vehic.gps_numeric_ident
    vehic.plate_number = gps_vehic.gps_plate_number.strip
    vehic.comments = gps_vehic.gps_descriptive_ident
    vehic.company_id = 1
    vehic.vehicle_type_id = 1
    vehic.vehicle_brand_id = 1
    
    vehic.creation_date = DateTime.current  
    vehic.status=2   # A validar

    @msgs = ""

    if ! vehic.valid?

      @msgs =  @msgs + "No se guardó el vehículo para GPS ID: " + gps_vehic.gps_numeric_ident + " PATENTE: " +  gps_vehic.gps_plate_number + "<br>"
 
      vehic.errors.each do |err|
        @msgs = @msgs + err.to_s + "; "
      end

      return nil
    else
      vehic.save
      @msgs =  @msgs + "Guardado vehículo para GPS ID: "  + gps_vehic.gps_numeric_ident + " PATENTE: " +  vehic.plate_number + "<br>"
      
      return vehic
    end

  end
  
  
  # Procesa un cambio de datos de gps que corresponde a un mismo vehiculo
  def gps_h_change_is_same_vehicle (gps_change)
    
    gps_vehicle = gps_change.gps_vehicle
    
    if gps_vehicle == nil 
      gps_vehicle = GpsRetiredVehicle.where(["original_gps_vehicle_id = ?", gps_change.gps_vehicle_id]).first
    end
    
    
    if gps_vehicle != nil   
      gps_retired = gps_change.gps_retired_vehicle
                  
      if gps_retired != nil 
        gps_vehicle.vehicle_id = gps_retired.vehicle_id
        gps_vehicle.save
        
        # actualizar posiciones
        gps_v_positions = GpsVehiclePosition.where("gps_vehicle_id=?", gps_vehicle.id)
        
        gps_v_positions.each do |pos|
          pos.vehicle_id = gps_vehic.vehicle_id
          pos.save
        end
                
        # actualizar lecturas de odometros
        gps_odometer_reads = GpsOdometerReading.where("gps_vehicle_id=?", gps_vehicle.id)
        
        gps_odometer_reads.each do |reading|
          reading.vehicle_id = gps_vehicle.vehicle_id
          reading.save
        end
         
        # calcular diferencias en lecturas de odometros si es posible
        
        # primero obtener las ultimas lecturas que se encuentren sin diferencia calculada junto con la ultima diferencia calculada
        sql = "select * from gps_odometer_readings where vehicle_id = " + gps_vehic.vehicle_id.to_s + " and created_at >=  (select max (or_int.created_at) from gps_odometer_readings or_int where or_int.vehicle_id = " + gps_vehic.vehicle_id.to_s + " and not or_int.difference is null ) order by created_at"
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
   
    
  end 
  
  # Procesa un cambio de datos de gps que corresponde a un nuevo vehiculo
  def gps_h_change_is_new_vehicle (gps_change)
    
    gps_vehic = gps_change.gps_vehicle
    gps_retired = gps_change.gps_retired_vehicle
    
    
    vehic = gps_h_create_vehicle_from_gps_vehic(gps_vehic)
    
    gps_vehic.vehicle_id = vehic.id
    gps_vehic.save
    
    
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
    
    gps_v = gps_change.gps_vehicle
    gps_retired = gps_change.gps_retired_vehicle
    
    
    if gps_retired != nil 
      
      # CASO MATRICULA y IDENTIFICADOR disintos
      if (gps_v.gps_plate_number != gps_retired.gps_plate_number) && (gps_v.gps_descriptive_ident != gps_retired.gps_descriptive_ident)
         
        
        # Crear el retired vehicle para el vehiculo        
        vehic = gps_retired.vehicle
        
        if vehic != nil
           
           
          retired = vehic.create_retired_vehicle(gps_retired.retirement_date, gps_retired.retirement_reason)
          
          retired.save
          vehic.destroy 
         
          
          retired =  "[" + gps_retired.gps_plate_number + "," + gps_retired.gps_plate_number + "] -> ["  + gps_v.gps_plate_number + "," + gps_v.gps_plate_number + "]"
          @retired_vehics << retired
          
          puts retired
          
        end
        
      end      
    end
    
    
  end
  
  
   
  
  
end
