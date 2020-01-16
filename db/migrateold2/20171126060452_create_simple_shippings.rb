class CreateSimpleShippings < ActiveRecord::Migration
  def change
    create_table :simple_shippings do |t|
      t.datetime :shipping_date
      t.integer :vehicle_id
      t.integer :coupled_vehicle_id
      t.integer :company_id
      t.integer :driver_id
      t.string :service_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :measure_unit_id
      t.decimal :unit_price, :precision => 8, :scale => 2
      t.text :documents
      t.integer :return_type_id
      t.text :comments
      t.string :invoice_number

      t.timestamps
    end
  end
end
