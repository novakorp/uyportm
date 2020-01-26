class AddGpsVehicleToGpsOdometerReading < ActiveRecord::Migration
  def change
    add_column :gps_odometer_readings, :gps_vehicle_id, :integer

  end
end
