class GpsInstallation < ActiveRecord::Base  
  belongs_to :vehicle
  has_one :gps_change_back, class_name: :GpsChange, foreign_key: :gps_prev_installation_id
  has_one :gps_change_fwd, class_name: :GpsChange, foreign_key: :gps_installation_id
  
  has_many :gps_vehicle_positions
  has_many :gps_odometer_readings
end
