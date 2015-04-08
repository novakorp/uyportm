class RemoveAccountFromCustomerShippingOrders < ActiveRecord::Migration
  def up
    remove_column :customer_shipping_orders, :account_id
  end

  def down
  end
end
