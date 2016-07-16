class AddDifferenceToVehicleOdometerReading < ActiveRecord::Migration
  def change
    add_column :vehicle_odometer_readings, :difference, :integer

  end
end
