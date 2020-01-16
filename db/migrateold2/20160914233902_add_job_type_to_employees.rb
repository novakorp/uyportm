class AddJobTypeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :job_type, :integer

  end
end
