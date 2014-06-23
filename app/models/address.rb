class Address < ActiveRecord::Base
	belongs_to :customer
	belongs_to :location
	
	has_many :requested_supplies
	has_many :requested_deliveries
end
