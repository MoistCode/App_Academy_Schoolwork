class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def require_user_logon
    unless session[:session_token].present?
      flash[:error] = 'Must be logged in'
      redirect_to new_session_url
    end
  end

  def current_user
    return nil unless session[:session_token].present?
    @current_user || User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
