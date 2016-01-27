class CommentsController < ApplicationController

    def index
      @contact = Contact.find(params[:contact_id])
      @user = User.find(params[:user_id])
      @author = User.find(params[:author_id])
      if @contact
        render json: ["CONTACTS:", @contact.comments, "SHARED CONTACTS:", @contact.shared_contacts.comments]
      elsif @user
        render json: @user.comments
      elsif @author
        render json: @author.comments
      end
    end

    def show
      @comment = Comment.find(params[:id])
      render json: @comment
    end

    def update
      # @contact = Contact.find(params[:id])
      # if @contact.update(params[:id], contact_params)
      #   render json: @contact
      # else
      #   render(
      #     json: contact.errors.full_messages, status: :unprocessable_entity
      #   )
      # end
    end

    def create
      @contact = Contact.find(params[:contact_id])
      @user = User.find(params[:user_id])
      if @user
        @comment = @user.comments.new(user_comment_params)
        @comment.save
        render json: @user.comments
      elsif @contact
        @comment = @contact.comments.new(contact_comment_params)
        @comment.save
        render json: @contact.comments
      end
    end

    def destroy
      @comment = Comment.destroy(params[:id])
      render json: @comment
    end

    private

    def contact_comment_params
      params.require(:comment).permit(:author_id, :contact_id, :body)
    end

    def user_comment_params
      params.require(:comment).permit(:author_id, :user_id, :body)
    end
end
