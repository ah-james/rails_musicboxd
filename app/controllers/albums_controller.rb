class AlbumsController < ApplicationController
    def index
        @albums = Album.order_by_artist_name
    end
    
    def new
        @album = Album.new
        @album.build_artist
    end

    def create
        @album = Album.new(album_params)
        valid_album_check
    end

    def show
        @album = Album.find_by(id: params[:id])
    end

    def edit
        @album = Album.find_by_id(params[:id])
    end

    def update
        @album = Album.find_by(params[:id])
        @album.update(album_params)
        redirect_to album_path(@album)
    end

    def destroy
        Album.destroy(params[:id])
        redirect_to album_path
    end

    private

    def album_params
        params.require(:album).permit(:title, :artist_id, artist_attributes: [:artist_name])
    end

    def valid_album_check
        if @album.valid?
            @album.save
            redirect_to album_path(@album)
        else
            render :new
        end
    end
end
