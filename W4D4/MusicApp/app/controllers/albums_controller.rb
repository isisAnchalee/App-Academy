class AlbumsController < ApplicationController
 before_action :prompt_login

	def index
		@albums = Album.all
		render :index
	end

	def create
		@album = Album.new(album_params)
		# fail
		if @album.save
			redirect_to album_url(@album)
		else
			# flash.now[:notice] = "Cannot Create Album"
			flash.now[:errors] = @album.errors.full_messages
			render :new
		end
	end

	def new
		@album = Album.new
		render :new
	end

	def edit
		@album = Album.find(params[:id])
		render :edit
	end

	def show
		@album = Album.find(params[:id])
		render :show
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(album_params)
			redirect_to album_url(@album)
		else
			flash.now[:notice] = "Cannot edit that!"
			render :edit
		end
	end

	def destroy
	 	@album = Album.find(params[:id])
	    if @album.destroy
	      redirect_to bands_url
	    else
	    	flash.now[:notice] = "Cannot destroy this album!"
	    render :show
	  end
	end
	
	private

	def album_params
		params.require(:album).permit(:band_id, :album_name, :recording_type)
	end
end
