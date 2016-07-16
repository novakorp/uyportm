require 'savon'


class Vehicle < ActiveRecord::Base
	validates :vehicle_brand_id, presence: true	
	validates :model, presence: true		
	
	validates :company_id, presence: true	
	validates :vehicle_type_id, presence: true	
	validates :number_plate, presence: true	
	
	
	belongs_to :company
	belongs_to :vehicle_type
  belongs_to :vehicle_brand
	
  has_one :vehicle_position
  
	has_many :shipments
	
	has_one :sucta_registration
	has_one :vehicle_registration
	has_many :vehicle_odometer_readings
  has_many :vehicle_gps_changes     
    
    def get_near_location()       
            longitud = 0 
            latitud = 0
            
            if self.vehicle_position 
              longitud = self.vehicle_position.longitude
              latitud = self.vehicle_position.latitude
            end
            
            dist_calc = "(point(" + longitud.to_s + "," + latitud.to_s + ") <-> "
   
            dist_calc_1 = dist_calc + "point (e.longitude , e.latitude))"
            dist_calc_2 = dist_calc + "point (i.longitude, i.latitude))"
      
            pos_cercana=Location.connection.select_all("Select e.name ," + dist_calc_1 + " / 0.010918996 as dist from locations e where " + dist_calc_1 + " = ( select min (" + 
                dist_calc_2 + ") from locations i )" )
                
            return pos_cercana[0]
  
    end
    
    def update_position(client)
      if ! self.vehicle_position 
        self.vehicle_position = VehiclePosition.new        
      end
      
      puts Time.now.to_s + "> Actualizando vehiculo " + self.gps_vehicle_id
      
            
      begin
        response=client.call(:consultar_ultima_posicion, :message => {'user' => 'ferreira', 'pass' => 'at78024agd912', 'movil_id' => self.gps_vehicle_id })
   
        wsdata=response.body[:consultar_ultima_posicion_response][:return]
    
        longitud = wsdata[:longitud].to_f 
        latitud = wsdata[:latitud].to_f
        
        self.vehicle_position.longitude=longitud
        self.vehicle_position.latitude=latitud
        
        self.vehicle_position.save
        
      rescue Savon::Error => soap_fault
        puts "ERROR: #{soap_fault}\n"
      end
  
    end
    
end 
