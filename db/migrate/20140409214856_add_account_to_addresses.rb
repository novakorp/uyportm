class AddAccountToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :account_id, :integer

	add_index "addresses", ["account_id"], :name => "index_addresses_on_account_id"
  end
end
