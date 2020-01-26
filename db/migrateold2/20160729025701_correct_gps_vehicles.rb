class CorrectGpsVehicles < ActiveRecord::Migration
  def up
    rename_column :gps_vehicles, :gps_vehicle_id, :gps_assigned_id
    rename_column :gps_vehicles, :gps_identifier, :gps_descriptive_id 
    
    rename_column :gps_retired_vehicles, :gps_vehicle_id, :gps_assigned_id
    rename_column :gps_retired_vehicles, :gps_identifier, :gps_descriptive_id 
    
    add_column :gps_retired_vehicles, :original_gps_vehicle_id, :integer
  end

  def down
  end
end
