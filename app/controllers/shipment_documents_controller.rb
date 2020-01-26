class ShipmentDocumentsController < ApplicationController

	def new		
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_document = @shipment.shipment_documents.build 
	end
	
	def create
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_document = ShipmentDocument.new(obj_params)
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
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to @shipment }
      format.js { render "/common/action_result.js" }
    end  
	end

  private

  def obj_params
    params.require(:shipment_document).permit(:document_type, :number_text, :comments)
  end
end
