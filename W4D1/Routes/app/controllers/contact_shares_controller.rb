class ContactSharesController < ApplicationController
  def create
    cs = ContactShare.new(contact_shares_params)
    if cs.save!
      render json: cs
    else
      render json: cs.errors.full_messages
    end
  end

  def destroy
    cd = ContactShare.find(params[:id])
    cd.destroy!
    render json: cd
  end

  private

  def contact_shares_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
