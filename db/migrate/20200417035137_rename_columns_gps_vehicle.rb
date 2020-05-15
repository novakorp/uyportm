class RenameColumnsGpsVehicle < ActiveRecord::Migration
  def change
    rename_column :gps_odometer_readings, :gps_vehicle_id, :gps_installation_id
    rename_column :gps_vehicle_positions, :gps_vehicle_id, :gps_installation_id

  end
end
