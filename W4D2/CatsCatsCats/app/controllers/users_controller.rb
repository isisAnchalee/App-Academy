class UsersController < ApplicationController
  before_action :to_cats
  
  def to_cats
    redirect_to(cats_url) if !current_user.nil?
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      
      redirect_to cats_url
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :password, :badger)
  end
end
