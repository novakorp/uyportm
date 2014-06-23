class CreateJobSpecs < ActiveRecord::Migration
  def change
    create_table :job_specs do |t|
      t.references :job_type
      t.references :trip
      t.references :account

      t.timestamps
    end
    add_index :job_specs, :job_type_id
    add_index :job_specs, :trip_id
    add_index :job_specs, :account_id
  end
end
