class Employee < ActiveRecord::Base
	has_many :shipments, class_name: "Shipment", foreign_key: "driver_id"
	belongs_to :company
	
	has_one :default_vehicle, class_name: "Vehicle"
	
	def get_complete_name 
	  return first_name + " " + last_name
	end
end
