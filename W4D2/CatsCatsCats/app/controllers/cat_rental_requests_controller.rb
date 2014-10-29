class CatRentalRequestsController < ApplicationController
  def index
    @cats = Cat.all
    @requests = CatRentalRequest.all
  end
  
  def create
    @cats = Cat.all
    @request = CatRentalRequest.new(cat_rental_params)
    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      render json: @request.errors.full_messages
    end
  end
  
  def new
    @cats = Cat.all
    @request = CatRentalRequest.new
  end
  
  def show
    @request = CatRentalRequest.find(params[:id])
    render json: @request
  end
  
  def destroy
    @request = CatRentalRequest.find(params[:id])
    @request.destroy!
    render json: @request
  end
  
  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    render :index
  end
  
  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    render :index
  end

  protected
  
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date,
    :end_date, :status)
  end
end
