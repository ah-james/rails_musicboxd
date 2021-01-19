class ReviewsController < ApplicationController

    def new
        @album = Album.find_by_id(params[:album_id])
        @review = @album.reviews.build
    end

    def create
        @review = Review.new(review_params)
    end
end
