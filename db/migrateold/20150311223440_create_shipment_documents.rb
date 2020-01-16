class CreateShipmentDocuments < ActiveRecord::Migration
  def change
    create_table :shipment_documents do |t|
      t.references :shipment
      t.references :document_type
      t.text :comment

      t.timestamps
    end
    add_index :shipment_documents, :shipment_id
    add_index :shipment_documents, :document_type_id
  end
end
