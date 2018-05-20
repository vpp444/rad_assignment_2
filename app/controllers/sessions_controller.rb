class SessionsController < ApplicationController
  def new
     
  end
 
 def create
  # user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
  user = User.find_by(name: user_params[:name])
  if user && user.authenticate(user_params[:password])
    login(user)
   flash[:success] = "Welcome to the Rmit News!"
   redirect_to login_path
  else
   flash[:success] = "invalid username or password"
    redirect_to login_path
  end
  
  
  def logout
    flash[:success] = "You have logged out."
    session[:user_id] = nil
    redirect_to login_path
  end
  
 
  
 end
 
 private
  def user_params
   params.require(:session).permit(:name, :password)
  end
end
