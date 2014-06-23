class CreateCargoCategories < ActiveRecord::Migration
  def change
    create_table :cargo_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
