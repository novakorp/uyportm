class DropVehicleColumns < ActiveRecord::Migration
  def up
    remove_column :vehicles, :brand
    remove_column :vehicles, :gps_vehicle_id
    remove_column :vehicles, :gps_description
    remove_column :vehicles, :gps_number_plate
  end

  def down
  end
end
