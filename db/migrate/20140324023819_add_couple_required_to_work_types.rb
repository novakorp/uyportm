class AddCoupleRequiredToWorkTypes < ActiveRecord::Migration
  def change
    add_column :work_types, :couple_required, :integer, :limit => 1

  end
end
