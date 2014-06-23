class DropTableRequestedWorks < ActiveRecord::Migration
  def change
	drop_table :requested_works
  end
end
