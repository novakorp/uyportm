class CreateSucta < ActiveRecord::Migration
  def change
    create_table :sucta do |t|
      t.datetime :expiration
      t.string :extended 
      t.text :comments
      t.references :vehicle

      t.timestamps
    end
    add_index :sucta, :vehicle_id
  end
end
