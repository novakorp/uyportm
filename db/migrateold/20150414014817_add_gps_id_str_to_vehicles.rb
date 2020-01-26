class AddGpsIdStrToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :gps_id_str, :string

  end
end
