class DropGpsVehicle < ActiveRecord::Migration
  def up
     drop_table :gps_vehicles
  end

  def down
  end
end
