class Drop < ActiveRecord::Migration 
  def up
    drop_table :work_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end 
end
