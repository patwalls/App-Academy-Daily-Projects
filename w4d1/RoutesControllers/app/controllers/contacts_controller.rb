class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    render json: ["CONTACTS:", @user.contacts, "SHARED CONTACTS:", @user.shared_contacts]
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(params[:id], contact_params)
      render json: @contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def create
    @user = User.find(params[:user_id])
    @contact = @user.contacts.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.destroy(params[:id])
    render json: @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:user_id)
  end
end
