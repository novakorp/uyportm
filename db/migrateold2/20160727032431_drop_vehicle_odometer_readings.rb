class DropVehicleOdometerReadings < ActiveRecord::Migration
  def up
     drop_table :vehicle_odometer_readings
  end

  def down
  end
end
