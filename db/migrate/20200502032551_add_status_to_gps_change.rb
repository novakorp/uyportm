class AddStatusToGpsChange < ActiveRecord::Migration
  def change
      add_column :gps_changes, :status, :integer
  end
end
