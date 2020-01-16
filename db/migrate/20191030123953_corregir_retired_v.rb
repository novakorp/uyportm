class CorregirRetiredV < ActiveRecord::Migration
  def change
	rename_column :retired_vehicles, :retirment_reason, :retirement_reason
  end
end
