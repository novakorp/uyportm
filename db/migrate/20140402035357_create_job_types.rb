class CreateJobTypes < ActiveRecord::Migration
  def change
    create_table :job_types do |t|
      t.string :description
      t.references :billing_unit
      t.references :vehicle_type
      t.integer :couple_type_id
      t.integer :couple_required, :limit => 1

      t.timestamps
    end
    add_index :job_types, :billing_unit_id
    add_index :job_types, :vehicle_type_id
  end
end
