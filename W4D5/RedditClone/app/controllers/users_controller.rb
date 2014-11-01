class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = 'Invalid sign up input'
      render :new
    end
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    render :edit
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to :new
    else
      flash.now[:errors] = "Cannot delete user!"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url
    else
      flash.now[:errors] = "Invalid login input!"
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
