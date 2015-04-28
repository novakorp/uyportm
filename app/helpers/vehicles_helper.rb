require 'savon'



module VehiclesHelper
  

   def update_vehicle_positions
  
    ## Inicializar  cliente web service

      @client = Savon.client(wsdl: 'http://190.64.141.170:8009/wcAdmin/services/ServiceDataBykom?wsdl', 
        endpoint: 'http://190.64.141.170:8009/wcAdmin/services/ServiceDataBykom.ServiceDataBykomHttpSoap12Endpoint/')

      @client.operations.to_s

      ## Actualizar posicion de vehiculos en la bd

      @vehicles = Vehicle.all

      @vehicles.each do |v|
        v.update_position @client
      end

    
  end

end
