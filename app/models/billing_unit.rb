class BillingUnit < ActiveRecord::Base
	has_many :services
end
