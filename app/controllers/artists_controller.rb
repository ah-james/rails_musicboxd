class ArtistsController < ApplicationController

    def index
        @artists = Artist.alphabetize_by_name
    end

    def show
        @artist = Artist.find_by_id(params[:id])
    end
end
