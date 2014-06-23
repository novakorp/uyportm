class ShipmentDelivery < ActiveRecord::Base
  belongs_to :shipment
  belongs_to :requested_delivery
end
