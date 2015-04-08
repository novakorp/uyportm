class Vehicle < ActiveRecord::Base
	validates :brand, presence: true	
	validates :model, presence: true		
	
	validates :company_id, presence: true	
	validates :vehicle_type_id, presence: true	
	validates :number_plate, presence: true	
	
	
	belongs_to :company
	belongs_to :vehicle_type
	
	has_many :shipments
	
	has_one :sucta_registration
	has_one :vehicle_registration
end 
