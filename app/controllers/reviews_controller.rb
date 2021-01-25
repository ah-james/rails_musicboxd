class ReviewsController < ApplicationController

    def index
        if params[:album_id]
            @album = Album.find_by_id(params[:album_id])
            @reviews = @album.reviews.order_by_highest_score
        else
            @reviews = Review.order_by_highest_score
        end
    end

    def new
        if @album = Album.find_by_id(params[:album_id])
            @album = Album.find_by_id(params[:album_id])
            @review = @album.reviews.build
            @review.build_track
        else
            @review = Review.new
            @review.build_track
        end
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        valid_review_check
    end

    def show
        @review = Review.find_by_id(params[:id])
        @user = User.find(@review.user_id)
        @track = @review.track
    end

    def edit
        @review = Review.find_by_id(params[:id])
        @review.build_track unless @review.track
    end

    def update
        @review = Review.find_by_id(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:review_text, :score, :album_id, track_attributes: [:track_title])
    end

    def valid_review_check
        if @review.valid?
            @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end
end
