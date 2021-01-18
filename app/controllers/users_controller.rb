class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = user.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
