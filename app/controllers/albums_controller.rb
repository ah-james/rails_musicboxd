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
        if @album.valid?
            @album.save
            redirect_to album_path(@album)
        else
            render :new
        end
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
        if @album.valid?
            redirect_to album_path(@album)
        else
            render :edit
        end
    end

    def destroy
        Album.destroy(params[:id])
        redirect_to album_path
    end

    private

    def album_params
        params.require(:album).permit(:title, :artist_id, artist_attributes: [:artist_name])
    end
end
