class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  
  skip_before_filter :verify_authenticity_token, if: :json_request?

  before_filter :require_login 
  
  
  
  private
 
  def require_login
    if ! signed_in?
      flash[:error] = "Debe iniciar sesión para realizar esta acción"
      redirect_to signin_path # halts request cycle
    end
  end
  
  
  def json_request?
    request.format.json?
  end
  
end
