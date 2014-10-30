class CatRentalRequestsController < ApplicationController
  before_action :owns_cat, only: [:approve, :deny]
  
  def owns_cat
    cat_id = CatRentalRequest.find(params[:id]).cat_id
    @cat = Cat.find(cat_id)
    redirect_to cats_url if @cat.user_id != current_user.id
  end
  
  def index
    @cats = Cat.all
    @requests = CatRentalRequest.all
    
  end
  
  def create
    @cats = Cat.all
    @request = CatRentalRequest.new(cat_rental_params)
    @request.user_id = current_user.id
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
    redirect_to cat_url(@request.cat_id)
  end
  
  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    redirect_to cat_url(@request.cat_id)
  end

  protected
  
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date,
    :end_date, :status)
  end
end
