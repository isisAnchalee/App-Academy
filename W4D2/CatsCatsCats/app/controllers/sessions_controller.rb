class SessionsController < ApplicationController
  def new
    @session = User.new 
    render :new
  end

  def create
    if @session = User.find_by_credentials(session_params)
      @session.reset_session_token!
      session[:session_token] = @session.session_token
      @session.save!
      redirect_to cats_url
    else
      render :new
    end
  end
  
  def destroy
    @session = current_user
    session[:session_token] = nil
    @session.reset_session_token!
    redirect_to cats_url
  end
  
  private
  def session_params
    params.require(:user).permit(:user_name, :password)
  end
end
