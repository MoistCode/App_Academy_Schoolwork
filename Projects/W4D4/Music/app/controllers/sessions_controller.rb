class SessionsController < ApplicationController

  before_action :require_user_logon, except: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      log_in_user!(user)
      flash[:success] = "Successfully logged in"
      redirect_to users_url
    elsif user.nil?
      flash.now[:errors] = "Incorrect username and/or password"
      render :new
    end
  end

  def destroy
    logout!
    redirect_to users_url
  end

end
