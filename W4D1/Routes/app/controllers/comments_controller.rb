class CommentsController < ApplicationController
  def index
    c = Comment.find(params[:contact_id])

    render json: c
  end

  def create
    c = Comment.new(comment_params)
    if c.save!
      render json: c
    else
      render json: c.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    c = Comment.find(params[:id])
    if c.update(comment_params)
      render json: c
    else
      render json: c.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    c = Comment.find(params[:id])
    render json: c
  end

  def destroy
    c = Comment.find(params[:id])
    c.destroy!
    render json: c
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :contact_id, :body)
  end
end
