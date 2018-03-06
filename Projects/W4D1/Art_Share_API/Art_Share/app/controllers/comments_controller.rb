class CommentsController < ApplicationController

  def index
    commenter = User.find(params[:user_id])
    render json: commenter.comments
  end

  def show_all_comments
    render json: Comment.all
  end

  def create
    created_comment = Comment.new(artwork_id: params[:artwork_id, commenter_id: params[:user_id], comment_body: params[:comment_body]])

    if created_comment.save
      render json: created_comment
    else
      render json: created_comment.errors.full_messages, status: 422
    end
  end

  def destroy

  end

  def update

  end

  def show

  end

  private

  def comment_params
    params.require(:comment).permit(:artwork_id, :commenter_id, :comment_body)
  end

end
