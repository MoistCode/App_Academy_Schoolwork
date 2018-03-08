class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :login!, :logout!

  def login!
    session[:session_token] = self.session_token
  end

  def logout!

  end
end
