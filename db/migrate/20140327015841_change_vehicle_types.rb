class ChangeVehicleTypes < ActiveRecord::Migration
  def up
	 change_table :vehicle_types do |t|
      t.change :coupling_support, :integer
    end
  end

  def down
  end
end
