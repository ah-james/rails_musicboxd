class ReviewsController < ApplicationController

    def index
        if params[:album_id]
            @album = Album.find_by_id(params[:album_id])
            @reviews = @album.reviews
        else
            @reviews = Review.all
        end
    end

    def new
        if @album = Album.find_by_id(params[:album_id])
            @review = @album.reviews.build
            @review.build_track
        else
            @review = Review.new
        end
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
        @track = @review.track
    end

    def edit
        @review = Review.find_by_id(params[:id])
        @review.build_track unless @review.track
    end

    def update
        @review = Review.find_by(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        Review.destroy(params[:id])
        redirect_to review_path
    end

    private

    def review_params
        params.require(:review).permit(:review_text, :score, :album_id, track_attributes: [:track_title])
    end
end
