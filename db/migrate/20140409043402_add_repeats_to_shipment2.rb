class AddRepeatsToShipment2 < ActiveRecord::Migration
  def change
    add_column :shipments, :repeats, :integer

  end
end
