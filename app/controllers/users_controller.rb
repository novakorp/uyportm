class UsersController < ApplicationController
	def new
		@user = User.new
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
	end

	def update
	  @user = User.find(params[:id])
	 
	 if @user.update_attributes(params[:user].permit(:name, :email, :password, :password_confirmation))
		redirect_to @user
	  else
		render 'edit'
	 end
	end


  def notify
    @user = User.find(params[:id])
    
      # Sends email to user when user is created.
     DefaultMailer.email_venc_sucta(@user).deliver
 
    redirect_to @user
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
