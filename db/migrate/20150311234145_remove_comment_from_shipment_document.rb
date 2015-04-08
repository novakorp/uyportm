class RemoveCommentFromShipmentDocument < ActiveRecord::Migration
  def up
    remove_column :shipment_documents, :comment
      end

  def down
    add_column :shipment_documents, :comment, :text
  end
end
