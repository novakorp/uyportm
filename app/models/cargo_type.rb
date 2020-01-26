class CargoType < ActiveRecord::Base
  belongs_to :cargo_category
  belongs_to :measure_unit
  
  has_many :requested_cargos
end
