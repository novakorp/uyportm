class CreateRequestedDeliveries < ActiveRecord::Migration
  def change
    create_table :requested_deliveries do |t|
      t.references :address
      t.string :recipient_name
      t.integer :ammount
      t.references :requested_cargo

      t.timestamps
    end
    add_index :requested_deliveries, :address_id
    add_index :requested_deliveries, :requested_cargo_id
  end
end
