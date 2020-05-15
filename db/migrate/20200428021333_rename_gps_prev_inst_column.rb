class RenameGpsPrevInstColumn < ActiveRecord::Migration
  def change
    rename_column :gps_prev_installations, :original_gps_vehicle_id, :original_gps_installation_id
  end
end
