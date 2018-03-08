class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil unless session[:session_token].present?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_current_user!
    if logged_in?
      #cannot log in again
      #cannot create new use
      redirect_to cats_url

    else
      #cannot view user
      redirect_to new_session_url
    end
    # redirect_to new_session_url if current_user.nil?
    # redirect_to cats_url if current_user
  end

end
