class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
 
  def new
  end

  def create
    user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash.now[:error] = 'E-mail o contraseña inválida'
      render 'new'
    end
  end

 def destroy
    sign_out
    redirect_to root_url
  end
  
end
