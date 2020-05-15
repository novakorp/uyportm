class RenameGpsChangesGpsVehicle < ActiveRecord::Migration
  def change
      rename_column :gps_changes, :gps_vehicle_id, :gps_installation_id
      
  end
end
