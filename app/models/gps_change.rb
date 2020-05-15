class GpsChange < ActiveRecord::Base
  belongs_to :gps_installation, class_name: :GpsInstallation
  belongs_to :gps_prev_installation, class_name: :GpsInstallation
end
