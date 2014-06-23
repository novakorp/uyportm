class ChangeSuctaExtended < ActiveRecord::Migration
  def up
	   change_table :sucta do |t|
		  t.change :extended, :integer, :limit => 1
		end
  end

  def down
  end
end
