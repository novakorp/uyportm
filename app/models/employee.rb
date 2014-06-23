class Employee < ActiveRecord::Base
	has_many :shipments, class_name: "Shipment", foreign_key: "driver_id"
	belongs_to :company
end
