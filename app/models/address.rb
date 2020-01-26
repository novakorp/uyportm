class Address < ActiveRecord::Base
	belongs_to :customer
	belongs_to :location
	
	has_many :shipment_supplies
	has_many :shipment_deliveries
end
