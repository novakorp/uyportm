class RenameGpsChangeColumn < ActiveRecord::Migration
  def change
    rename_column :gps_changes, :gps_retired_vehicle_id, :gps_prev_installation_id
  end
end
