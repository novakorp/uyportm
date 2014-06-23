class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :personal_id
      t.string :personal_id_type

      t.timestamps
    end
  end
end
