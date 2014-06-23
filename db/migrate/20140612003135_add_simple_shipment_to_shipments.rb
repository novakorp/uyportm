class AddSimpleShipmentToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :simple_shipment, :integer

  end
end
