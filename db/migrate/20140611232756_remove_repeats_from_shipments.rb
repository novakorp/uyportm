class RemoveRepeatsFromShipments < ActiveRecord::Migration
   def up
	remove_column :shipments, :repeats
  end

  def down
  end
end
