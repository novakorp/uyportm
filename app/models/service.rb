class Service < ActiveRecord::Base
	has_many :shipping_requests
	
	belongs_to :billing_unit
	belongs_to :vehicle_type
	belongs_to :couple_type, class_name: "VehicleType"
	belongs_to :company 
end
