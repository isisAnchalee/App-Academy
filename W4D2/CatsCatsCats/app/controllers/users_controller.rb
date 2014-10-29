class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token)
  end
end
