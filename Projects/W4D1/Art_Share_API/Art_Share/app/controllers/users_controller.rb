class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    created_user = User.new(user_params)

    if created_user.save
      render json: created_user
    else
      render json: created_user.errors.full_messages, status: 422
    end
  end

  def destroy
    destroyed_user = User.find(params[:id])
    destroyed_user.destroy
    render json: destroyed_user
  end

  def update
    updated_user = User.find(params[:id])
    if updated_user.update(user_params)
      render json: updated_user
    else
      render json: updated_user.errors.full_messages, status: 422
    end
  end

  def show
    shown_user = User.find(params[:id])
    render json: shown_user
  end

  def show_user_artworks
    shown_user = User.find(params[:id])
    render json: shown_user.artworks
  end

  def show_shared_with
    shown_user = User.find(params[:id])
    render json: shown_user.shared_artworks
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
