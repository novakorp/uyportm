class RenameVehiclePositions < ActiveRecord::Migration
  def up
    rename_table :vehicle_positions, :gps_vehicle_positions
  end

  def down
  end
end
