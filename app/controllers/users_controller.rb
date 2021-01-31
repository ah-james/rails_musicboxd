class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        @reviews = @user.reviews.order_by_highest_score
    end

    def destroy
        User.destroy(params[:id])
        redirect_to '/'
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
