class Account < ActiveRecord::Base
	has_many :shipping_requests
	belongs_to :customer
	has_many :m_shipping_requests
	 
	attr_reader :select_description	

	def select_description
	  customer.name + " -> " + description
	end
end
