module ApplicationHelper
    
    def login_check
        session[:user_id] && session[:user_id] == @user.id
    end
end
