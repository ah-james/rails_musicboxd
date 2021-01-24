class ArtistsController < ApplicationController

    def index
        @artists = Artist.alphabetize_by_name
    end
end
