class RemoveGpsVehicleIdFromGpsOdometerReadings < ActiveRecord::Migration
  def up
    remove_column :gps_odometer_readings, :gps_vehicle_id 
  end

  def down
  end
end
