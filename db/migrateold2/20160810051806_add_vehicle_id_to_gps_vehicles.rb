class AddVehicleIdToGpsVehicles < ActiveRecord::Migration
  def change
    add_column :gps_vehicles, :vehicle_id, :integer

  end
end
