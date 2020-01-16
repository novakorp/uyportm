class GpsChange < ActiveRecord::Base
  belongs_to :gps_vehicle
  belongs_to :gps_retired_vehicle
end
