class UserController < ApplicationController
  def new
  @user = User.new
  end
 
 def create
  @user = User.new(user_params)
  if @user.save
    login(@user)
   flash[:success] = "Welcome to the Rmit News!"
   redirect_to :login_index
  else
   flash[:success] = "Fails to match the validation."
   redirect_to login_path
  end
 end
 
 private
  def user_params
   params.require(:user).permit(:name, :password)
  end
end
