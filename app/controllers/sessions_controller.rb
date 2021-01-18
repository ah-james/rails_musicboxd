class SessionsController < ApplicationController
    def welcome
    end

    def new
    end

    def create
        session[:username] = params[:username]
        redirect_to 'sessions/show'
    end

    def destroy
        session.delete :username
    end
end