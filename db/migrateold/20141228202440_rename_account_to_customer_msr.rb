class RenameAccountToCustomerMsr < ActiveRecord::Migration
  def change
    remove_column :m_shipping_requests, :account_id   
    add_index "m_shipping_requests", ["customer_id"], :name => "index_m_shipping_requests_on_customer_id"    
  end
end
