class RemoveVehicleId < ActiveRecord::Migration
  def change
    remove_column :gps_odometer_readings, :vehicle_id
    remove_column :gps_vehicle_positions, :vehicle_id
  end
end
