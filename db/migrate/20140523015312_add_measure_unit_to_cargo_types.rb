class AddMeasureUnitToCargoTypes < ActiveRecord::Migration
  def change
    add_column :cargo_types, :measure_unit_id, :integer
	
	add_index "cargo_types", ["measure_unit_id"], :name => "index_addresses_on_measure_unit_id"
  end
end
