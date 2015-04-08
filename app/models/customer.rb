class Customer < ActiveRecord::Base
	has_many :accounts
	has_many :addresses
    
  has_many :m_shipping_requests
   
	has_many :customer_shipping_orders
end
