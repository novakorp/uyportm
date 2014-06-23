class DropWorks < ActiveRecord::Migration
  def up
    drop_table :works
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end 
end
