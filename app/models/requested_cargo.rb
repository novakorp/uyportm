class RequestedCargo < ActiveRecord::Base
  belongs_to :cargo_type
  belongs_to :shipping_request
  belongs_to :measure_unit
  
  has_many :requested_supplies
  has_many :requested_deliveries
end
