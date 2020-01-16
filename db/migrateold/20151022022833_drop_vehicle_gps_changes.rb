class DropVehicleGpsChanges < ActiveRecord::Migration
  def up
    drop_table :vehicle_gps_changes
  end

  def down
  end
end
