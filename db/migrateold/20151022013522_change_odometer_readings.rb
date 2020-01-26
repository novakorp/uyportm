class ChangeOdometerReadings < ActiveRecord::Migration
  def up
    rename_column :vehicle_odometer_readings, :gps_id_str, :gps_vehicle_id
    rename_column :vehicle_odometer_readings, :partial_reading, :gps_partial_read
    rename_column :vehicle_odometer_readings, :total_reading, :gps_total_read
  end

  def down
  end
end
