class AddToVehicles < ActiveRecord::Migration
  def up
    add_column :vehicles, :retirment_date, :datetime
    add_column :vehicles, :retirement_reason, :integer
    add_column :vehicles, :retirement_comments, :text
    
  end

  def down
  end
end
