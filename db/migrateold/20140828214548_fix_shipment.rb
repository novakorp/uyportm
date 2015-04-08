class FixShipment < ActiveRecord::Migration
  def change
     remove_index "shipment_supplies", ["requested_supply_id"]
     remove_index "shipment_deliveries", ["requested_delivery_id"]
     
     rename_column :shipment_supplies, :requested_supply_id, :address_id
     rename_column :shipment_deliveries, :requested_delivery_id, :address_id
     
     add_index "shipment_deliveries", ["address_id"], :name => "index_shipment_deliveries_on_address_id"
     add_index "shipment_supplies", ["address_id"], :name => "index_shipment_supplies_on_address_id"
 
  end
end
