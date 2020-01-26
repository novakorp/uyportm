class AddMeasureUnitToShippingRequest < ActiveRecord::Migration
  def change
    add_column :shipping_requests, :measure_unit_id, :integer
    
    add_index "shipping_requests", ["measure_unit_id"], :name => "index_shipping_requests_on_measure_unit_id"
  end
end
