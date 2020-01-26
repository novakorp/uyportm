class AddOriginalVehicleIdToRetiredVehicles < ActiveRecord::Migration
  def change
    add_column :retired_vehicles, :original_vehicle_id, :integer

  end
end
