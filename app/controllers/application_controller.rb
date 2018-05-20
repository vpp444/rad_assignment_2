class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def login(user)
    session[:user_id] = user.id
  end
  
  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.nil? ? false : true
  end
  

  
  
# private

#   def require_login
#     unless logged_in?
#       flash[:error] = "You must be logged in to access this section"
#       redirect_to :login_index # halts request cycle
#     end
#   end
  helper_method :current_user, :logged_in? 
end
