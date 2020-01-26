class MShippingRequest < ActiveRecord::Base
  belongs_to :service
  belongs_to :trip
  belongs_to :customer
  
  has_many :shipping_requests
  has_many :m_requested_cargos
  
end
