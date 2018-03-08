class UsersController < ApplicationController

  def index
    # Placeholder for now
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      login_user!(@user)
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
