class AddCustomerRedToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :customer_id, :integer

	add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"
 
  end
end
