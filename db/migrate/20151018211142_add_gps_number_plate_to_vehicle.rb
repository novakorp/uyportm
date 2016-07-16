class AddGpsNumberPlateToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :gps_number_plate, :integer
    
    add_index "vehicles", ["gps_number_plate"], :name => "index_vehicles_on_gps_number_plate"
  end
end
