class CreateOrderNSeq < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE order_number_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE order_number_seq;
    SQL
  end
end
