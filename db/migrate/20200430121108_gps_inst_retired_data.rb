class GpsInstRetiredData < ActiveRecord::Migration
  def change
    add_column :gps_installations, :retirement_date, :datetime
    add_column :gps_installations, :retirement_reason, :integer
  end
end
