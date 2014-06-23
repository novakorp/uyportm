class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :bill_number
      t.text :details
      t.integer :state
	  t.date :date_requested
	  t.date :date_of_work

	  t.belongs_to :trip
	  t.belongs_to :vehicle
	  t.belongs_to :employee
	  t.belongs_to :account
	  t.belongs_to :work_type
      t.timestamps
    end
  end
end
