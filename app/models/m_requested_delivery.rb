class MRequestedDelivery < ActiveRecord::Base
  belongs_to :address
  belongs_to :m_requested_cargo
end
