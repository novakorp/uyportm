class AddTypeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :type, :integer, :limit => 1

  end
end
