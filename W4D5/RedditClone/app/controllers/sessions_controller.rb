class SessionsController < ApplicationController
  before_action :to_index, only: [:new, :create]
  
  def to_index
    redirect_to(subs_url) if !current_user.nil?
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(
      session_params[:email], 
      session_params[:password]
    )
    
    if @user
      log_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Invalid email or password"]
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to new_session_url
  end
  
  private
  def session_params
    params.require(:user).permit(:password, :email)
  end
end
