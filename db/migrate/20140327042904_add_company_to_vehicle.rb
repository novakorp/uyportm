class AddCompanyToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :company_id, :integer

  end
end
