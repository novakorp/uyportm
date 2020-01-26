class AddGpsSpeedToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_speed, :string

  end
end
