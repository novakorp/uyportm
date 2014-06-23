class ShipmentSupply < ActiveRecord::Base
  belongs_to :shipment
  belongs_to :requested_supply
end
