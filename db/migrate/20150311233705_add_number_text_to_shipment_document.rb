class AddNumberTextToShipmentDocument < ActiveRecord::Migration
  def change
    add_column :shipment_documents, :number_text, :string

  end
end
