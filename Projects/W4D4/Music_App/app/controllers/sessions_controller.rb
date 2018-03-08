class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    User.find_by_credentials(user_params)
    reset_session_token!
  end

  def destroy
    reset_session_token!
    session[:session_token] = nil
  end



  private

  def user_params
    params.permit(:user).permit(:email, :password)
  end

end
