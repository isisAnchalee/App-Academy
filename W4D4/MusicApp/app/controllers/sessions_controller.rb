class SessionsController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.find_by_credentials(session_params[:email],session_params[:password] )
		if @user
			log_in!(@user)
			redirect_to users_url
		else
			render :new
		end
	end

	def destroy
	end

	private

	def session_params
		params.require(:user).permit(:email, :password)
	end

end
