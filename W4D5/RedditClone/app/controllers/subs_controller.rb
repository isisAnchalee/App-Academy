class SubsController < ApplicationController
  before_action :validate_post_author, only: [:update]
  
  def validate_post_author
    @sub = Sub.find_by(params[:id])
    @sub.user_id == current_user.id
  end
  
  def index
    @subs = Sub.all
    render :index
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:error] = 'Cannot create this sub :('
      render :new
    end
  end
  
  def new
    @sub = Sub.new
    render :new
  end
  
  def edit
    @sub = Sub.new
    render :edit
  end
  
  def update
    @sub = Sub.find(params[:id])
    if @sub.update
      redirect_to sub_url(@sub)
    else
      flash.now[:error]= 'Cannot edit this!'
      render :edit
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
    render :show
  end
  
  def destroy
    @sub = Sub.find(params[:id])
    if @sub.destroy
      redirect_to subs_url
    end
  end
  
  private
  
  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end
end
