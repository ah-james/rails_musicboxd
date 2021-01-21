class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        @review = Review.find_by(params[:review_id])
    end

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
        @track = Track.find_by(params[:review_id])
    end

    def edit
        @review = Review.find_by_id(params[:id])
    end

    def update
        @review = Review.find_by(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    private

    def review_params
        params.require(:review).permit(:review_text, :score, :album_id)
    end
end
