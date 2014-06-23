class Trip < ActiveRecord::Base
	belongs_to :from_location , class_name: "Location"
	belongs_to :to_location , class_name: "Location"
	has_many :shipping_requests
	
	attr_reader :description	

	def description
	  from_location.name + " -> " + to_location.name
	end
end
