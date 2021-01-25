module ApplicationHelper

    def login_check
        session[:user_id]
    end
    
    def creator_check
        session[:user_id] && session[:user_id] == @user.id
    end
end
