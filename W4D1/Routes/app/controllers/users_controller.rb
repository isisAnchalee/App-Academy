class UsersController < ApplicationController

  def index
     render json: User.all
  end

  def show
    u = User.find(params[:id])
    render json: u
  end

  def create
    u = User.new(user_params)

    if u.save
      render json: u
    else
      render text: u.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    u = User.find(params[:id])
    u.destroy!
    render json: u
  end

  def update
    u = User.find(params[:id])
    if u.update(user_params)
      render json: u
    else
      render json: u.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
