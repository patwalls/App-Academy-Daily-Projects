class ContactSharesController < ApplicationController

    def index
      render json: ContactShare.all
    end

    def show
      @contact_share = ContactShare.find(params[:id])
      render json: @contact_share
    end

    def update
      @contact_share = ContactShare.find(params[:id])
      if @contact_share.update(params[:id], contact_share_params)
        render json: @contact_share
      else
        render(
          json: contact_share.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def create
      @contact_share = ContactShare.new(contact_share_params)
      if @contact_share.save
        render json: @contact_share
      else
        render(
          json: contact_share.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def destroy
      @contact_share = ContactShare.destroy(params[:id])
      render json: @contact_share
    end

    private

    def contact_share_params
      params.require(:contact_share).permit(:contact_id, :user_id)
    end
end
