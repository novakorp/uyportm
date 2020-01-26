class AddDefaultDriverToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :default_driver_id, :integer

  end
end
