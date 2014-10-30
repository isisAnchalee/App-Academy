class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			render :show
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		render :new
	end
	
	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
