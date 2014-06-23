class CreateRequestedCargos < ActiveRecord::Migration
  def change
    create_table :requested_cargos do |t|
      t.integer :ammount
      t.references :cargo_type
      t.references :shipping_request
      t.references :measure_unit

      t.timestamps
    end
    add_index :requested_cargos, :cargo_type_id
    add_index :requested_cargos, :shipping_request_id
    add_index :requested_cargos, :measure_unit_id
  end
end
