class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.references :location
      t.string :recipient
      t.string :address_detail_1
      t.string :address_detail_2
      t.string :postal_code

      t.timestamps
    end
    add_index :shipping_addresses, :location_id
  end
end
