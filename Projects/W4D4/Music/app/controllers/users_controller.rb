class UsersController < ApplicationController

  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      flash[:success] = "Successfully logged in!"
      redirect_to users_url
    else
      flash.now[:errors] = "Cannot process request. Please try again"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
