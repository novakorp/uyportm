class CreateReturnTypes < ActiveRecord::Migration
  def change
    create_table :return_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
