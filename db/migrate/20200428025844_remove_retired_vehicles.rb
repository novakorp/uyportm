class RemoveRetiredVehicles < ActiveRecord::Migration
  def change
    drop_table :retired_vehicles
  end
end
