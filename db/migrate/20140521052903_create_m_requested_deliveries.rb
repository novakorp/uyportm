class CreateMRequestedDeliveries < ActiveRecord::Migration
  def change
    create_table :m_requested_deliveries do |t|
      t.integer :ammount
      t.references :address
      t.text :coments
      t.references :requested_cargo

      t.timestamps
    end
    add_index :m_requested_deliveries, :address_id
    add_index :m_requested_deliveries, :requested_cargo_id
  end
end
