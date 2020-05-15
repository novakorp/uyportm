class RenameGpsvehicles < ActiveRecord::Migration
  def change
    rename_table :gps_vehicles, :gps_installations
  end
end
