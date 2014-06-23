class CreateMRequestedCargos < ActiveRecord::Migration
  def change
    create_table :m_requested_cargos do |t|
      t.integer :ammount
      t.references :cargo_type
      t.references :m_shipping_request
      t.references :measure_unit

      t.timestamps
    end
    add_index :m_requested_cargos, :cargo_type_id
    add_index :m_requested_cargos, :m_shipping_request_id
    add_index :m_requested_cargos, :measure_unit_id
  end
end
