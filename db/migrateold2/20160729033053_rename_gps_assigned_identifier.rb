class RenameGpsAssignedIdentifier < ActiveRecord::Migration
  def up
    rename_column :gps_vehicles, :gps_assigned_id, :gps_numeric_ident
    rename_column :gps_vehicles, :gps_descriptive_id, :gps_descriptive_ident
    
     rename_column :gps_retired_vehicles, :gps_assigned_id, :gps_numeric_ident
    rename_column :gps_retired_vehicles, :gps_descriptive_id, :gps_descriptive_ident
    
  end

  def down
  end
end
