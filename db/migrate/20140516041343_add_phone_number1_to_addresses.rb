class AddPhoneNumber1ToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :phone_number_1, :string

  end
end
