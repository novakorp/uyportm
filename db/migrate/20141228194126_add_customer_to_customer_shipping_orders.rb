class AddCustomerToCustomerShippingOrders < ActiveRecord::Migration
  def change
    add_column :customer_shipping_orders, :customer_id, :integer
    
    add_index "customer_shipping_orders", ["customer_id"], :name => "index_customer_shipping_orders_on_customer_id"
  end
end
