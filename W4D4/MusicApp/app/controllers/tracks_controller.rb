class TracksController < ApplicationController
 before_action :prompt_login

	def create
		@track = Track.new(track_params)
		if @track.save
			redirect_to track_url(@track)
		else
			flash.now[:errors] = @track.errors.full_messages
			render :new
		end
	end
	
	def new
		@track = Track.new
		render :new
	end

	def edit
		@track = Track.find(params[:id])
		render :edit
	end

	def show
		@track = Track.find(params[:id])
		render :show
	end

	def update
		@track = Track.find(params[:id])
		if @track.update(track_params)
			redirect_to track_url(@track)
		else
			flash.now[:errors] = @track.errors.full_messages
			render :new
		end
	end

	def destroy
		@track = Track.find(params[:id])
		if @track.destroy
			redirect_to bands_url
		else
			flash.now[:errors] = @track.errors.full_messages
			render :show
		end
	end

	def track_params
		params.require(:track).permit(:album_id, :track_name, :lyrics, :track_type)
	end
end

