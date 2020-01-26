class Account < ActiveRecord::Base
	belongs_to :customer
  	 
	attr_reader :select_description	

	def select_description
	  customer.name + " -> " + description
	end
end
