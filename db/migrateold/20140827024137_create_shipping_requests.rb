class CreateShippingRequests < ActiveRecord::Migration
  def change
    create_table :shipping_requests do |t|
      t.references :customer_shipping_order
      t.references :m_shipping_request
      t.references :service
      t.integer :trip_quantity
      t.integer :cargo_quantity
      t.references :trip
      t.references :cargo_type
      t.text :comments

      t.timestamps
    end
    add_index :shipping_requests, :customer_shipping_order_id
    add_index :shipping_requests, :m_shipping_request_id
    add_index :shipping_requests, :service_id
    add_index :shipping_requests, :trip_id
    add_index :shipping_requests, :cargo_type_id
  end
end
