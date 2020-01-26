class VehicleType < ActiveRecord::Base
	has_many :couplable_types, class_name: "VehicleType", foreign_key: "couples_to_type_id"
	belongs_to :couples_to_type, class_name:  "VehicleType"
	
	
	validates :description, presence: true
	validates :couples_to_type_id, presence: true, if: "coupling_support==1"

	has_many :vehicles
end
