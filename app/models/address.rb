class Address < ActiveRecord::Base
	belongs_to :customer
	belongs_to :location  
  belongs_to :business_entity
  
  
	has_many :shipment_supplies
	has_many :shipment_deliveries
	
	has_many :m_vehicle_inspections
	has_many :vehicle_inspections
end
