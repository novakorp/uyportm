class Trip < ActiveRecord::Base
	belongs_to :from_location , class_name: "Location"
	belongs_to :to_location , class_name: "Location"
	has_many :shipping_requests
	
	attr_reader :description	

	def description
	  from_location.name + " -> " + to_location.name
	end
  
  def duration_minutes  
    # Duracion del viaje: distancia x 60 / velocidad (en km/h)
    return self.distance * 60 / 90
  end
  
end

