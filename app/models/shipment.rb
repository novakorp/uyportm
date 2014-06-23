class Shipment < ActiveRecord::Base
  belongs_to :shipping_request
  belongs_to :vehicle
  belongs_to :coupled_vehicle, class_name: "Vehicle"
  belongs_to :driver, class_name: "Employee"
  
  has_many :shipment_supplies
  has_many :shipment_deliveries
end
