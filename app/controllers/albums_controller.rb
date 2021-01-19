class AlbumsController < ApplicationController
    def new
        @album = Album.new
        @album.build_artist
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_path(@album)
        else
            render :new
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
    end

    private

    def album_params
        params.require(:album).permit(:title, :artist_id, artist_attributes: [:artist_name])
    end
end
