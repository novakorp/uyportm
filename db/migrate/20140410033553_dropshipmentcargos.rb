class Dropshipmentcargos < ActiveRecord::Migration
  def change
	drop_table :shipment_cargos
  end
end
