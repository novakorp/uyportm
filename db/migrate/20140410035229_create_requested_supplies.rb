class CreateRequestedSupplies < ActiveRecord::Migration
  def change
    create_table :requested_supplies do |t|
      t.integer :ammount
      t.references :address
      t.text :comments
      t.references :requested_cargo

      t.timestamps
    end
    add_index :requested_supplies, :address_id
    add_index :requested_supplies, :requested_cargo_id
  end
end
