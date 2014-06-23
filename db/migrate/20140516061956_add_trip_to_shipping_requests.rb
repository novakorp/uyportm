class AddTripToShippingRequests < ActiveRecord::Migration
  def change
    add_column :shipping_requests, :trip_id, :integer

  end
end
