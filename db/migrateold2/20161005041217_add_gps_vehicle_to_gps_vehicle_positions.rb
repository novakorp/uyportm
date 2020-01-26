class AddGpsVehicleToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_vehicle_id, :integer

  end
end
