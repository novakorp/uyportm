class MeasureUnit < ActiveRecord::Base
	has_many :requested_cargos
	has_many :cargo_categories
end
