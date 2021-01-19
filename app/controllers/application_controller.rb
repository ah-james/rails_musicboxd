class ApplicationController < ActionController::Base

    helpers do
        def current_user
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end
    end
end
