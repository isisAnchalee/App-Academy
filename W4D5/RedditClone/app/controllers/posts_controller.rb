class PostsController < ApplicationController
  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.sub_ids = post_params[:sub_ids]
    if @post.save
      redirect_to sub_url(@post.subs.first)
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
    @post = Post.find(params[:id])
    render :edit
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = "Failed!!"
      render :edit
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
    params.require(:post).permit(:title, :content, :url, sub_ids: [])
  end
end
