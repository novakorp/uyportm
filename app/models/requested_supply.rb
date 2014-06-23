class RequestedSupply < ActiveRecord::Base
  belongs_to :address
  belongs_to :requested_cargo
  
  has_many :shipment_supplies
end
