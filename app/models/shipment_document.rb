class ShipmentDocument < ActiveRecord::Base
  belongs_to :shipment
  belongs_to :document_type
end
