class AddSimpleShipmentToMShippingRequests < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :simple_shipment, :integer

  end
end
