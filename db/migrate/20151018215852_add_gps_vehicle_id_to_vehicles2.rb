class AddGpsVehicleIdToVehicles2 < ActiveRecord::Migration
  def change
       add_column :vehicles, :gps_vehicle_id, :string
  end
end
