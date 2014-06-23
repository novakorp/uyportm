class CreateCargoTypes < ActiveRecord::Migration
  def change
    create_table :cargo_types do |t|
      t.string :description
      t.references :cargo_category

      t.timestamps
    end
    add_index :cargo_types, :cargo_category_id
  end
end
