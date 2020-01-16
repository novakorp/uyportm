class RenameColumnGpsVehiclePos < ActiveRecord::Migration
  def up
    rename_column :gps_vehicle_positions, :longitude, :gps_longitude
    rename_column :gps_vehicle_positions, :latitude, :gps_latitude    
  end

  def down
  end
end
