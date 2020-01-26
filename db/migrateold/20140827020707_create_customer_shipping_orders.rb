class CreateCustomerShippingOrders < ActiveRecord::Migration
  def change
    create_table :customer_shipping_orders do |t|
      t.references :company
      t.integer :order_number
      t.datetime :order_datetime
      t.references :account
      t.date :shipping_date
      t.text :comments

      t.timestamps
    end
    add_index :customer_shipping_orders, :company_id
    add_index :customer_shipping_orders, :account_id
  end
end
