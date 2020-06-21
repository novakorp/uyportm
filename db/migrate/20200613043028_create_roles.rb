class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :comments

      t.timestamps null: false
    end
  end
end
