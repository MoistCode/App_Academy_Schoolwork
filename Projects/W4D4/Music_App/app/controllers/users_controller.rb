class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "Successfully created account. Welcome #{user.email}"
      redirect_to users_url
    else
      flash.now[:errors] = ['Cannot create account, please try again']
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
