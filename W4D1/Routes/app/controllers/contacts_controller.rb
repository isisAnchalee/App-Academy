class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    c = Contact.find(params[:id])
    render json: c
  end

  def create
    c = Contact.new(contact_params)
    if c.save
      render json: c
    else
      render json: c.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    c = Contact.find(params[:id])
    if c.update(contact_params)
      render json: c
    else
      render json: c.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    c = Contact.find(params[:id])
    c.destory!
    render json: c
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
