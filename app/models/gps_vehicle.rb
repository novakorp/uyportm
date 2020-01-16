class GpsVehicle < ActiveRecord::Base  
  belongs_to :vehicle
  has_one :gps_change
end
