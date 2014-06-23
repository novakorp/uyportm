class Customer < ActiveRecord::Base
	has_many :accounts
	has_many :addresses
end
