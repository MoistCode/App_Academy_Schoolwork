class SessionsController < ApplicationController
  # before_action :require_current_user!, except: [:destroy]

  def new
    render 'users/login'
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user
      login!(user)
      flash[:success] = "Successfully Logged In!"
      redirect_to cats_url
    else
      flash.now[:errors] = ["Incorrect Password"]
      render :new
    end

  end

  def destroy
    if current_user
      logout!
      flash[:success] = "Successfully logged out"
    end
    redirect_to cats_url
  end

end
