class DocumentType < ActiveRecord::Base
  has_many :shipment_documents
end
