class Vehicle < ActiveRecord::Base
	validates :brand, presence: true	
	validates :model, presence: true		
	validates :number_plate, presence: true
end 
