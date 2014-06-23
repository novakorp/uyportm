class MShippingRequest < ActiveRecord::Base
  belongs_to :service
  belongs_to :trip
  belongs_to :account
  
  has_many :m_requested_cargos
  
  
end
