class RolesController < ApplicationController 
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(obj_params)

    if @role.save
    redirect_to @role
    else
    render 'new'
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def index
    @roles = Role.all
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
   
   if @role.update_attributes(params[:role].permit(:name, :comments))
    redirect_to @role
    else
    render 'edit'
   end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to roles_path }
      format.js { render "/common/action_result.js" }
    end  
  end
  
  private

  def obj_params
    params.require(:role).permit(:name, :comments)
  end 

end
