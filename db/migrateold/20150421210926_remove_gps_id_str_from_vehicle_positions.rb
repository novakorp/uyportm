class RemoveGpsIdStrFromVehiclePositions < ActiveRecord::Migration
  def up
    remove_column :vehicle_positions, :gps_id_str
  end

  def down
  end
end
