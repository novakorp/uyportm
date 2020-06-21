class CreateBusinessEntities < ActiveRecord::Migration
  def change
    create_table :business_entities do |t|
      t.string :name
      t.integer :entity_type
      t.text :description

      t.timestamps null: false
    end
  end
end
