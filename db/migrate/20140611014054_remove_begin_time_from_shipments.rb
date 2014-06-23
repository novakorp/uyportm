class RemoveBeginTimeFromShipments < ActiveRecord::Migration
  def up
	remove_column :shipments, :begin_time
  end

  def down
  end
end
