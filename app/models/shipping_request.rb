class ShippingRequest < ActiveRecord::Base
  belongs_to :service
  belongs_to :trip
  belongs_to :account
  
  has_many :requested_cargos
  has_many :shipments
  
  
  attr_reader :description	

  def description
	  account.customer.name + ":" + service.description
  end
end
