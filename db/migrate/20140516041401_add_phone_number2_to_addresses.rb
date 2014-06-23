class AddPhoneNumber2ToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :phone_number_2, :string

  end
end
