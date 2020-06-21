class AddBusinessEntityRefToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :business_entity, index: true, foreign_key: true
  end
end
