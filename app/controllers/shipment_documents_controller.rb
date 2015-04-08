class ShipmentDocumentsController < ApplicationController

	def new		
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_document = @shipment.shipment_documents.build 
	end
	
	def create
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_document = ShipmentDocument.new(params[:shipment_document])
		@shipment_document.shipment_id = @shipment.id
		
	  if @shipment_document.save
		 redirect_to  @shipment 
	  else
		render 'new'
	  end
	end

	def show
	  @shipment_document = ShipmentDocument.find(params[:id])
	end

	def edit
	  @shipment_document = ShipmentDocument.find(params[:id])	  
	end

	def update
	  @shipment_document = ShipmentDocument.find(params[:id])	 
	  @shipment = @shipment_document.shipment
	 
	 if @shipment_document.update_attributes(params[:shipment_document].permit(:document_type, :number_text, :comments))
		redirect_to @shipment
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipment_document = ShipmentDocument.find(params[:id])	
	  @shipment = @shipment_document.shipment
	  @shipment_document.destroy
	 
	  redirect_to @shipment
	end

end
