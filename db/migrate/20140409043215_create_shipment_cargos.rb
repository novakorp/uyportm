class CreateShipmentCargos < ActiveRecord::Migration
  def change
    create_table :shipment_cargos do |t|
      t.references :shipment
      t.references :requested_cargo
      t.integer :load_address_id

      t.timestamps
    end
    add_index :shipment_cargos, :shipment_id
    add_index :shipment_cargos, :requested_cargo_id
  end
end
