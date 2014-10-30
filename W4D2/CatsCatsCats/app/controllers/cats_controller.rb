class CatsController < ApplicationController
  before_action :owns_cat, only: [:edit, :update]
  
  def owns_cat
    @cat = Cat.find(params[:id])
    redirect_to cats_url if @cat.user_id != current_user.id
  end
  
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @requests = CatRentalRequest.where("cat_id = ?",params[:id]).order("start_date ASC")
    @cat = Cat.find(params[:id])
    render :show
  end
  
  def create
    @cat = Cat.new(cat_params)
    @user_id = current_user.id
    @cat.user_id = @user_id
    
    if @cat.save!
      redirect_to cats_url
    else
      render :new 
    end
  end
  
  def new
    @cat = Cat.new
  end
  
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cats_url
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy!
    render json: @cat
  end
  private
  
  def cat_params
    params.require(:cat).permit(:birth, :color, :name, :sex, :description)
  end
end
