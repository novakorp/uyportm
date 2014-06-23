class CreateRequestedWorks < ActiveRecord::Migration
  def change
    create_table :requested_works do |t|
      t.string :bill_number
      t.text :details
      t.integer :state, :limit => 1
      t.date :request_date
      t.date :requested_work_date
      t.references :job_type
      t.integer :quantity
      t.string :requester
      t.references :billing_unit
      t.integer :quantity

      t.timestamps
    end
    add_index :requested_works, :job_type_id
    add_index :requested_works, :billing_unit_id
  end
end
