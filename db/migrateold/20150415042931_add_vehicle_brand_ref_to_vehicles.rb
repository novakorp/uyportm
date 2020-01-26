class AddVehicleBrandRefToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_brand_id, :integer
    
    add_index "vehicles", ["vehicle_brand_id"], :name => "index_vehicles_on_vehicle_brand_id"
  end
end
