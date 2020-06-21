class CreateMVehicleInspections < ActiveRecord::Migration
  def change
    create_table :m_vehicle_inspections do |t|
      t.string :name
      t.references :business_entity, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.integer :inspection_type
      t.text :comments

      t.timestamps null: false
    end
  end
end
