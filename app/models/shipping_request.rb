class ShippingRequest < ActiveRecord::Base
  belongs_to :customer_shipping_order
  belongs_to :m_shipping_request
  belongs_to :service
  belongs_to :trip
  belongs_to :cargo_type
  belongs_to :measure_unit
end
