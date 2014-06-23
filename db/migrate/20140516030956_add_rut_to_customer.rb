class AddRutToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :rut, :string

  end
end
