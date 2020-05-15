class AddActiveToGpsInstallations < ActiveRecord::Migration
  def change
    add_column :gps_installations, :active, :boolean
  end
end
