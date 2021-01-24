class SessionsController < ApplicationController
    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
        # @user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        # end
      
        # session[:user_id] = @user.id

        # redirect_to login_path
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end