class Company < ActiveRecord::Base
	has_many :services
	has_many :vehicles
	has_many :employees
    has_many :customer_shipping_orders
end
