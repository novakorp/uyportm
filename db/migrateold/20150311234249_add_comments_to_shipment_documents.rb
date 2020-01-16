class AddCommentsToShipmentDocuments < ActiveRecord::Migration
  def change
    add_column :shipment_documents, :comments, :text

  end
end
