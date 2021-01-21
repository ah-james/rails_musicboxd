class RenameTracksTableAndRenameArtistId < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorite_tracks, :artist_id, :review_id
    rename_table :favorite_tracks, :favorite_favorite_tracks
  end
end
