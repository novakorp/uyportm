class VehicleBrand < ActiveRecord::Base
    validates :name, presence: true
	validates :abbreviation, presence: true 

	has_many :vehicles
end
