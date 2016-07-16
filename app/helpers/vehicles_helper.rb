require 'savon'



module VehiclesHelper
  
  # Devuelve un objeto cliente para consumir los metodos del web service.
  
  def get_client
    client = Savon.client(wsdl: ENV['gps_ws_url'], 
        endpoint: ENV['gps_ws_endpoint']);
        
    return client;      
  end
  
  
  # Actualiza las posiciones de todos los vehículos.
  # Se invoca desde 
  
  def update_vehicle_positions
  
      ## Inicializar  cliente web service

      @client = get_client;

      @client.operations.to_s

      ## Actualizar posicion de vehiculos en la bd

      @vehicles = Vehicle.all

      @vehicles.each do |v|
        v.update_position @client
      end

    
  end

 
 def vh_save_odometer_readings_tmp
    begin
      client = get_client;
      client.operations.to_s

      response=client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })

      wsdata=response.body[:consultar_odometro_flota_response][:return]

      wsdata.each do |data|
        
       readings = VehicleOdometerReading.where("gps_vehicle_id = ?", data[:movil_id]).order("gps_datetime desc")
     
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
        
#       data [:result_busqueda_id] = reading.gps_vehicle_id
#       data [:result_busqueda_dt] = reading.gps_datetime.to_s   
#       data [:result_busqueda_pr] = reading.gps_partial_read.to_s   




      end

      return wsdata

    rescue Savon::Error => soap_fault
      puts "ERROR: #{soap_fault}\n"
    end
  end
  
  
 def vh_save_odometer_readings
    begin
      client = get_client;
      client.operations.to_s

      response=client.call(:consultar_odometro_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })

      wsdata=response.body[:consultar_odometro_flota_response][:return]

      wsdata.each do |data|

        vehic = Vehicle.first(:conditions => ["gps_vehicle_id = ?", data[:movil_id]])
        
        
        if  vehic != nil
          
          if (vehic.gps_number_plate == data[:patente])
            last_reading = VehicleOdometerReading.where("gps_vehicle_id = ?", data[:movil_id]).order("gps_datetime desc").first
        
            fecha_gps = data[:fecha_gps].to_datetime
           
            if last_reading != nil
              if (last_reading.gps_datetime.to_i - fecha_gps.to_i).abs > 23 
                    
                odom_reading = VehicleOdometerReading.new
  
                odom_reading.gps_vehicle_id = data[:movil_id]
                odom_reading.gps_datetime = fecha_gps
                odom_reading.gps_partial_read = data[:odometro_parcial].to_i
                odom_reading.gps_total_read = data[:odometro_total].to_i
                odom_reading.vehicle_id = vehic.id
                odom_reading.difference = odom_reading.gps_total_read - last_reading.gps_total_read
  
                odom_reading.save            
               
              end
            end
            
           
          end
        end
      end

      return wsdata

    rescue Savon::Error => soap_fault
      puts "ERROR: #{soap_fault}\n"
    end
  end


  def consultar_moviles    
   client = get_client;
   client.operations.to_s         
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })
   
   #@wsdata = client.operations.to_s
   
    @wsdata2=response.body[:consultar_moviles_flota_response][:return]
    
  
  end
  
  
  def crear_moviles    
   client = get_client;
   client.operations.to_s         
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })
  
   #@wsdata = client.operations.to_s
   
    @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
    @wsdata.each do |data|
      
      vehic = Vehicle.new
      vehic.brand = "marca"
      vehic.model = "modelo" 
      vehic.number_plate = data[:patente] 
      vehic.gps_id_str = data[:movil_id] 
      vehic.comments = data[:identificador] 
      vehic.company_id = 1
      vehic.vehicle_type_id = 1
      
      if ! vehic.valid?
        vehic.errors.each do |err|
            puts err.to_s
        end
      end
      
   #   vehic.save
      
      puts "Guardando " + vehic.number_plate
    end
  
  end
  
  
  def vh_update_vehicles_gps_data
   client = get_client;
   client.operations.to_s         
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })
   
   #@wsdata = client.operations.to_s
    
    @msgs = ""
    
    @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
    @wsdata.each do |data| 
      @msgs = ""
      
      vehic = Vehicle.first(:conditions => ["gps_vehicle_id = ?", data[:movil_id]])   
      
      if vehic.nil?
        vehic = Vehicle.new
        vehic.brand = "marca"
        vehic.model = "modelo" 
        vehic.number_plate = data[:patente] 
        vehic.comments = data[:identificador] 
        vehic.gps_vehicle_id = data[:movil_id]
        vehic.gps_number_plate = data[:patente]
        vehic.gps_description = data[:identificador]
        vehic.company_id = 1
        vehic.vehicle_type_id = 1
        vehic.vehicle_brand_id = 1
        
       
      
        if ! vehic.valid?
          
          @msgs =  "No se guardó el vehículo " + data[:movil_id] + " PATENTE: " + vehic.number_plate + "<br>"
          
          vehic.errors.each do |err|
              @msgs = @msgs + err.to_s + "; "
          end
          
          
        else
          vehic.save
          @msgs =  "Guardado "  + data[:movil_id] + " PATENTE: " +  vehic.number_plate + "<br>"
        end
      
        data[:patente_ant] = data[:patente]
        
        
      else
        
        data[:patente_ant] = vehic.gps_number_plate

     
        if vehic.gps_number_plate != data[:patente]
            @msgs =  "ATENCION CAMBIO EN GPS_ID:" + data[:movil_id] + " , PATENTE ANT:" + data[:patente_ant] + " , PATENTE:" + data[:patente] + "<br>"
            
            data[:mostrar_acc] = "1"
        else
           
      #     vehic.gps_number_plate = data[:patente]
      #     vehic.gps_description = data[:identificador]
           
      #     if vehic.vehicle_brand_id.nil?
      #       vehic.vehicle_brand_id = 1
      #     end
           
      #     if vehic.valid?
      #        vehic.save          
      #        @msgs =  "Actualizado"
      #     else
      #       @msgs= "Error actualizando vehículo: "
      #        vehic.errors.each do |err|
      #          @msgs = @msgs + err.to_s + "; "
      #       end
      #     end

        end
        
      end    
      
      data[:comments] = @msgs
    end
  end
  
  def vh_create_from_gps_data
   client = get_client;
   client.operations.to_s         
   
   # parametro recibido por url
   gps_id = params[:gps_vehicle_id] 
   
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })
      
   @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
   @wsdata.each do |data|  
     
     if data[:movil_id] == gps_id
        vehic = Vehicle.first(:conditions => ["gps_vehicle_id = ?", data[:movil_id]])   
      
        if ! vehic.nil?
           
          vehic.gps_vehicle_id = ""
          vehic.save
        end
                  
        vehic = Vehicle.new
        vehic.brand = "marca"
        vehic.model = "modelo" 
        vehic.number_plate = data[:patente] 
        vehic.comments = data[:identificador] 
        vehic.gps_vehicle_id = data[:movil_id]
        vehic.gps_number_plate = data[:patente]
        vehic.gps_description = data[:identificador]
        vehic.company_id = 1
        vehic.vehicle_type_id = 1
        vehic.vehicle_brand_id = 1
        
       
        if ! vehic.valid?
          
          @msgs =  "No se guardó el vehículo " + data[:movil_id] + " PATENTE: " + vehic.number_plate + "<br>"
          
          vehic.errors.each do |err|
              @msgs = @msgs + err.to_s + "; "
          end
          
          
        else
          vehic.save
          @msgs =  "Guardado "  + data[:movil_id] + " PATENTE: " +  vehic.number_plate + "<br>"
        end       
      end
      
    end
        
    redirect_to '/vehicles/update_vehicles_gps_data'   
  end
  
  
  def vh_update_from_gps_data
   client = get_client;
   client.operations.to_s         
   
   # parametro recibido por url
   gps_id = params[:gps_vehicle_id] 
   
   
   response = client.call(:consultar_moviles_flota, :message => {'user' => ENV['gps_ws_user'], 'pass' => ENV['gps_ws_password'] })
      
   @wsdata=response.body[:consultar_moviles_flota_response][:return]
    
   @wsdata.each do |data|  
     
     if data[:movil_id] == gps_id
       
        vehic = Vehicle.first(:conditions => ["gps_vehicle_id = ?", data[:movil_id]]) 
        
       vehic.gps_number_plate = data[:patente]
       vehic.gps_description = data[:identificador]
       
       vehic.number_plate = data[:patente]
       vehic.comments = data[:identificador]
       
       vehic.save
            
      end
    end
        
    redirect_to '/vehicles/update_vehicles_gps_data'   
  end
  
  
end

