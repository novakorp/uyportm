class RemoveShippingRequests < ActiveRecord::Migration
  def up
    drop_table :shipping_requests

  end

  def down
  end
end
