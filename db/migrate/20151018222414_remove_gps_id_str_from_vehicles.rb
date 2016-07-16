class RemoveGpsIdStrFromVehicles < ActiveRecord::Migration
  def up
    remove_column :vehicles, :gps_id_str
  end

  def down
  end
end
