class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
  def logged_in?
    !!current_user
  end
  
  def login_check
    if !logged_in?
      redirect '/login'
    end
  end
end
