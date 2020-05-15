class RenameGpsRetiredVehicles < ActiveRecord::Migration
  def change
    rename_table :gps_retired_vehicles, :gps_prev_installations
  end
end
