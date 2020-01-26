class CargoCategory < ActiveRecord::Base
	has_many :cargo_types
end
