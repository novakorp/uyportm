class AddAccountToMShippingRequests < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :account_id, :integer

	add_index "m_shipping_requests", ["account_id"], :name => "index_m_shipping_requests_on_account_id"
  end
end
