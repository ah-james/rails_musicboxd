class ApplicationController < ActionController::Base

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to '/', notice: 'Please login' unless logged_in?
  end
end
