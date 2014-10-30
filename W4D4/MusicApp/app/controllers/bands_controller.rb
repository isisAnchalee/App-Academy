class BandsController < ApplicationController
 before_action :prompt_login

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def new
    @band = Band.new
    render :new
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def show

    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      flash.now[:notice] = "Cannot Destroy Band"
      render :show
    end
  end

  private

  def band_params
  	params.require(:band).permit(:name)
  end

end
