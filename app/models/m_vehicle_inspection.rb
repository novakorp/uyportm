class MVehicleInspection < ActiveRecord::Base
  belongs_to :business_entity
  belongs_to :address
end
