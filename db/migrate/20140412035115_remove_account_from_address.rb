class RemoveAccountFromAddress < ActiveRecord::Migration
  def change
	 
	remove_index "addresses",   :name => "index_addresses_on_account_id"
	remove_column :addresses, :account_id
  end
end
