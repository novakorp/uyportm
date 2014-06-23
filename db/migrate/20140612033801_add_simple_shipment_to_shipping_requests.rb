class AddSimpleShipmentToShippingRequests < ActiveRecord::Migration
  def change
    add_column :shipping_requests, :simple_shipment, :integer

  end
end
