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
	
	has_many :shipments
	
	has_one :sucta_registration
	has_one :vehicle_registration
       
    
    def get_near_location(client)
           response=client.call(:consultar_ultima_posicion, :message => {'user' => 'ferreira', 'pass' => 'at78024agd912', 'movil_id' => gps_id_str })
   
   
           wsdata=response.body[:consultar_ultima_posicion_response][:return]
  
  
            longitud = wsdata[:longitud].to_f.abs 
            latitud = wsdata[:latitud].to_f.abs
   
            dist_calc = "(point(" + longitud.to_s + "," + latitud.to_s + ") <-> "
   
            dist_calc_1 = dist_calc + "point (e.longitude , e.latitude))"
            dist_calc_2 = dist_calc + "point (i.longitude, i.latitude))"
   
   
   
            pos_cercana=Location.connection.select_all("Select e.name ," + dist_calc_1 + " / 0.010918996 as dist from locations e where " + dist_calc_1 + " = ( select min (" + 
                dist_calc_2 + ") from locations i )" )
                
            return pos_cercana[0]
  
    end
end 
