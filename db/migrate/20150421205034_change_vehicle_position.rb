class ChangeVehiclePosition < ActiveRecord::Migration
  def up
    add_column :vehicle_positions, :vehicle_id, :integer
    
    add_index "vehicle_positions", ["vehicle_id"], :name => "index_vehicle_positions_on_vehicle_id"   

  end

  def down
  end
end
