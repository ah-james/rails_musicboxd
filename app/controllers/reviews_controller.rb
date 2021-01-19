class ReviewsController < ApplicationController

    def new
        @album = Album.find_by_id(params[:album_id])
        @review = @album.reviews.build
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:review_text, :score, :album_id)
    end
end
