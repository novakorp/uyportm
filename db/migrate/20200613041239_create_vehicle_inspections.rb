class CreateVehicleInspections < ActiveRecord::Migration
  def change
    create_table :vehicle_inspections do |t|
      t.references :m_vehicle_inspection
      t.references :vehicle
      t.references :address
      t.datetime :insp_datetime
      t.integer :status
      t.integer :result
      t.references :employee
      t.text :comments

      t.timestamps null: false
    end
  end
end
