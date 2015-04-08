class CreateOrderNSequence < ActiveRecord::Migration
 def up
    #add sequence to 
    execute <<-SQL
        ALTER TABLE customer_shipping_orders ALTER COLUMN order_number SET DEFAULT nextval('order_number_seq'::regclass)
    SQL
  end
 
  def down
	execute <<-SQL
		ALTER TABLE customer_shipping_orders ALTER COLUMN order_number SET NOT NULL
	SQL
  end
end
