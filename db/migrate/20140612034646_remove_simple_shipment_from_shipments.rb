class RemoveSimpleShipmentFromShipments < ActiveRecord::Migration
  def up
	remove_column :shipments, :simple_shipment
  end

  def down
  end
end
