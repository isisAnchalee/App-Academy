class PostsController < ApplicationController
  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      flash.now[:errors] = "Fail sauce!"
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @subs = Sub.all
    @post = Post.new
    render :edit
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_posts_url
    else
      flash.now[:error] = "Failed!!"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to subs_url
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :url, sub_id: [])
  end
end
