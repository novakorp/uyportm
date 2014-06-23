class AddCoupleTypeIdToWorkTypes < ActiveRecord::Migration
  def change
    add_column :work_types, :couple_type_id, :integer

  end
end
