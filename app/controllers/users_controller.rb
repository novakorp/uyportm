class UsersController < ApplicationController
  include UsersHelper
  
	def new 
		@user = User.new
    
    # Roles a mostrar para seleccion
    @roles = Role.order(:name)
	end
	
	def create
	  @user = User.new(obj_params)

	  if @user.save
		  redirect_to @user
	  else
		  render 'new'
	  end
	end

	def show
	  @user = User.find(params[:id]) 
	 
	end

	def index
	  @users = User.all
	end

	def edit
	  @user = User.find(params[:id])
    
    # Roles a mostrar para seleccion
    @roles = Role.order(:name)
    
    # genero array de ids de roles del usuario
    @user_roles = UserRole.where('user_id=?', @user.id).pluck(:role_id)	  
    
   
	end

	def update
    @user = User.find(params[:id])
        
    # Validar datos	 
  	if @user.update_attributes(params[:user].permit(:name, :email, :password, :password_confirmation)) 
  	  
  	  # Actualizar roles del usuario segun roles seleccionados  
  	  param_checked_roles=params[:check_roles_usuario]
  		users_h_update_user_roles(@user, param_checked_roles)
  		
  		redirect_to @user
  		 
    else
      render 'edit'
  	end
	end


  def show
    @user = User.find(params[:id])
  end
 
  def change_password
    @user = current_user
  end
  
  def change_password_submit
    @user = current_user
    
    if params[:user][:current_password] == ''
      flash.now[:error] = 'Debe ingresar la contraseña actual'
      
      render 'change_password'
    elsif params[:user][:password].strip == ''
      flash.now[:error] = 'Debe ingresar la nueva contraseña'
      
      render 'change_password'
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash.now[:error] = 'La nueva contraseña no fue confirmada correctamente'
      
       render 'change_password'
    elsif ! @user.authenticate(params[:user][:current_password])
      flash.now[:error] = 'La contraseña actual no es correcta'
    
       render 'change_password'
    elsif @user.update_attributes(params[:user].permit(:password, :password_confirmation))
       flash[:notice] = 'La contraseña fue actualizada correctamente'
       
       redirect_to welcome_index_path
    else
       render 'change_password'
    end
   
  end
   
	def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js { render "/common/action_result.js" }
    end  
     
	end
	
  private

  def obj_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
