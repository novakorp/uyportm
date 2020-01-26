class RemoveTextFromVehicles < ActiveRecord::Migration
  def up
    remove_column :vehicles, :text
  end

  def down
  end
end
