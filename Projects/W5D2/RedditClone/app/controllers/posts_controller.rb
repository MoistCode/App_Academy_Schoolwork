class PostsController < ApplicationController
  before_action :require_login

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      post_params[:sub_ids].each do |id|
        PostSub.create(
          post_id: @post.id,
          sub_id: id.to_i
        )
      end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def edit
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:sub_id])
    @post = @sub.posts.find(params[:id])
    @post.destroy
    redirect_to sub_url(@sub)
  end

  def post_params
    params.require(:post).permit(:title, :content, sub_ids: [])
  end
end
