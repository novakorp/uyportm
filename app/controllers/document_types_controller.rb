class DocumentTypesController < ApplicationController
	def new
		@document_type = DocumentType.new
	end
	
	def create
	  @document_type = DocumentType.new(obj_params)

	  if @document_type.save
		redirect_to @document_type
	  else
		render 'new'
	  end
	end

	def show
	  @document_type = DocumentType.find(params[:id])
	end

	def index
	  @document_types = DocumentType.all
	end

	def edit
	  @document_type = DocumentType.find(params[:id])
	end

	def update
	  @document_type = DocumentType.find(params[:id])
	 
	 if @document_type.update_attributes(params[:document_type].permit(:description))
		redirect_to @document_type
	  else
		render 'edit'
	 end
	end

	def destroy
	  @document_type = DocumentType.find(params[:id])
	  @document_type.destroy
  
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to document_types_path }
      format.js { render "/common/action_result.js" }
    end 
    
	end
	
  private

  def obj_params
    params.require(:document_type).permit(:description)
  end
end
