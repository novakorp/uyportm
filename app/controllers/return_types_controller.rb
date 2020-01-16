class ReturnTypesController < ApplicationController
  def new
    @return_type = ReturnType.new
  end
  
  def create
    @return_type = ReturnType.new(obj_params)

    if @return_type.save
    redirect_to @return_type
    else
    render 'new'
    end
  end

  def show
    @return_type = ReturnType.find(params[:id])
  end

  def index
    @return_types = ReturnType.all
  end

  def edit
    @return_type = ReturnType.find(params[:id])
  end

  def update
    @return_type = ReturnType.find(params[:id])
   
   if @return_type.update_attributes(params[:return_type].permit(:description))
    redirect_to @return_type
    else
    render 'edit'
   end
  end

  def destroy
    @return_type = ReturnType.find(params[:id])
    @return_type.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to return_types_path }
      format.js { render "/common/action_result.js" }
    end 
    
    
  end
  
  private

  def obj_params
    params.require(:return_type).permit(:description)
  end
end
