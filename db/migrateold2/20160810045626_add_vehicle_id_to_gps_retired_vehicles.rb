class AddVehicleIdToGpsRetiredVehicles < ActiveRecord::Migration
  def change
    add_column :gps_retired_vehicles, :vehicle_id, :integer

  end
end
