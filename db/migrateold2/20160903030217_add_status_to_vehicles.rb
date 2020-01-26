class AddStatusToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :status, :integer

  end
end
