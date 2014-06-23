class AddServiceToMShippingRequests < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :service_id, :integer

	add_index "m_shipping_requests", ["service_id"], :name => "index_m_shipping_requests_on_service_id"
  end
end
