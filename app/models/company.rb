class Company < ActiveRecord::Base
	has_many :services
	has_many :vehicles
	has_many :employees
end
