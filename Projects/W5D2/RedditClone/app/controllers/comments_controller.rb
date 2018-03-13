class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to post_url(@comment.post)
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    render :edit
  end

  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to post_url(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :comment_id)
  end
end
