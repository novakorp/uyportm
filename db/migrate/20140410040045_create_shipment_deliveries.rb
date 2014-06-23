class CreateShipmentDeliveries < ActiveRecord::Migration
  def change
    create_table :shipment_deliveries do |t|
      t.integer :ammount
      t.references :shipment
      t.references :requested_delivery

      t.timestamps
    end
    add_index :shipment_deliveries, :shipment_id
	 add_index :shipment_deliveries, :requested_delivery_id
  end
end
