class AddCompanyRefToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :company_id, :integer

	add_index "employees", ["company_id"], :name => "index_employees_on_company_id"
  end
end
