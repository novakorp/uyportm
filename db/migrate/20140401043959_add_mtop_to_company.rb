class AddMtopToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :mtop, :string

  end
end
