class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :trade_name
      t.string :rut
      t.string :bps
      t.string :mtss

      t.timestamps
    end
  end
end
