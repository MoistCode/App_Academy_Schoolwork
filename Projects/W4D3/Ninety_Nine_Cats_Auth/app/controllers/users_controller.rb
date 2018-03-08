class UsersController < ApplicationController
  before_action :require_current_user!

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:success] = "Successfully setup account!"
      redirect_to cats_url
    else
      flash.now[:errors] = ["Not successful."]
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
