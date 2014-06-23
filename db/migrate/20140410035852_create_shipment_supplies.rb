class CreateShipmentSupplies < ActiveRecord::Migration
  def change
    create_table :shipment_supplies do |t|
      t.integer :ammount
      t.references :shipment
      t.references :requested_supply

      t.timestamps
    end
    add_index :shipment_supplies, :shipment_id
	 add_index :shipment_supplies, :requested_supply_id
  end
end
