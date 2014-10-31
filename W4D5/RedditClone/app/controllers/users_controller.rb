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
    
  end
  
  def destroy
    
  end
  
  
  def update
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
