class AddTripToMShippingRequests < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :trip_id, :integer

	add_index "m_shipping_requests", ["trip_id"], :name => "index_m_shipping_requests_on_trip_id"
  end
end
