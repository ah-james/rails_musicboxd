class AddArtistIdToAlbumsAndRemoveAlbumIdFromArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :artist_id, :integer
    remove_column :artists, :album_id, :integer
  end
end
