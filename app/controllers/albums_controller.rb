class AlbumsController < ApplicationController
    def new
        @album = Album.new
        @album.artists.build
    end

    def create
        @album = Album.create(album_params)
        if @album.save
            redirect_to album_path(@album)
            byebug
        else
            render :new
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
    end

    private

    def album_params
        params.require(:album).permit(:title)
    end
end
