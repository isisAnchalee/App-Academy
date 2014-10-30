class TracksController < ApplicationController
 before_action :prompt_login

	def create
		@track = Track.new
	end
	
	def new
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end

	def track_params
		params.require(:track).permit(:album_id, :track_name, :lyrics, :track_type)
	end
end

