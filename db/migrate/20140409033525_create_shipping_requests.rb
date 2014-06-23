class CreateShippingRequests < ActiveRecord::Migration
  def change
    create_table :shipping_requests do |t|
      t.references :service
      t.references :journey
      t.references :account
      t.string :bill_number
      t.date :request_date
      t.date :required_shipment_date
      t.string :contact
      t.text :details

      t.timestamps
    end
    add_index :shipping_requests, :service_id
    add_index :shipping_requests, :journey_id
    add_index :shipping_requests, :account_id
  end
end
