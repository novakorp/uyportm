class RemoveShipmentDatetimeFromShipments < ActiveRecord::Migration
  def up
	remove_column :shipments, :shipping_datetime
  end

  def down
  end
end
