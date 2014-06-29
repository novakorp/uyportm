class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  / before_filter :require_login /
  
  private
 
  def require_login
    if ! signed_in?
      flash[:error] = "Debe iniciar sesión para realizar esta acción"
      redirect_to signin_path # halts request cycle
    end
  end
  
end
