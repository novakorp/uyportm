class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number

	  t.belongs_to :customer
      t.timestamps
    end
  end
end
