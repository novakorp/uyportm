require 'savon'


class Vehicle < ActiveRecord::Base
	validates :vehicle_brand_id, presence: true	
	validates :model, presence: true		
	
	validates :company_id, presence: true	
	validates :vehicle_type_id, presence: true	
	validates :plate_number, presence: true	
	
	
	belongs_to :company
	belongs_to :vehicle_type
  belongs_to :vehicle_brand
  
  belongs_to :default_driver, class_name: "Employee"
	
	has_many :shipments
	
	has_one :sucta_registration
	has_one :vehicle_registration
	

  has_one :gps_vehicle  
  has_many :gps_vehicle_positions
	has_many :gps_odometer_readings
    
 

   def get_near_location(gps_position)       
        longitud = 0 
        latitud = 0
        
        if gps_position != nil
          longitud = gps_position.gps_longitude
          latitud = gps_position.gps_latitude
        end
        
        dist_calc = "(point(" + longitud.to_s + "," + latitud.to_s + ") <-> "
 
        dist_calc_1 = dist_calc + "point (e.longitude , e.latitude))"
        dist_calc_2 = dist_calc + "point (i.longitude, i.latitude))"
  
        pos_cercana=Location.connection.select_all("Select e.name ," + dist_calc_1 + " / 0.010918996 as dist from locations e where " + dist_calc_1 + " = ( select min (" + 
            dist_calc_2 + ") from locations i )" )
            
        return pos_cercana[0]
   
    end
    
    def get_last_position()       
        
        last_pos = self.gps_vehicle_positions.order(:gps_datetime).last
            
        return last_pos

    end
    
    
    
    def description() 
        return self.plate_number + ' ' + self.vehicle_type.description 
    end
    
    
    def create_retired_vehicle(retirement_date, retirement_reason)
      
      retired = RetiredVehicle.new
      
      retired.model = self.model
      retired.plate_number = self.plate_number
      retired.comments = self.comments
      retired.company_id = self.company_id
      retired.vehicle_type_id = self.vehicle_type_id
      retired.vehicle_brand_id = self.vehicle_brand_id
      
      retired.retirement_date = retirement_date
      retired.retirement_reason = retirement_reason
      
      retired.original_vehicle_id = self.id
            
      return retired
    end
           
end 




