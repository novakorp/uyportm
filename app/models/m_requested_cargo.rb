class MRequestedCargo < ActiveRecord::Base
  belongs_to :cargo_type
  belongs_to :measure_unit
  belongs_to :m_shipping_request
  
  has_many :m_requested_supplies
  has_many :m_requested_deliveries
end
