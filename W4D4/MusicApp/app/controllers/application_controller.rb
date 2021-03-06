class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	helper_method :current_user
  helper_method :logged_in?
 	helper_method :prompt_login

  def current_user
  	User.find_by(session_token: session[:session_token]) || nil
  end

  def log_in!(user)
    #creates a new session token on login
    session[:session_token] = user.reset_session_token!
  end

 def log_out!
   session[:session_token] = nil
 end

  def logged_in?
    !current_user.nil?
  end

  def prompt_login
    unless logged_in?
      flash[:errors] = "Plase Login To See Pages"
      redirect_to new_session_url
    end
  end

end
