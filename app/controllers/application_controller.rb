class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logged_in?
    return false if session[:session_token].nil?
    current_user.session_token == session[:session_token]
  end
end
