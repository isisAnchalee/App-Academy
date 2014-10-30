class AlbumsController < ApplicationController

	def index
		@albums = Album.all
	end

	def create
		@album = Album.new()
	end

	def new
		@album = Album.new
	end

	def edit
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end
	
	private
	
	def album_params
	end
end
