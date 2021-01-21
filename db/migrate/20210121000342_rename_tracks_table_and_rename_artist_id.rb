class RenameTracksTableAndRenameArtistId < ActiveRecord::Migration[6.1]
  def change
    rename_column :tracks, :artist_id, :review_id
    rename_table :tracks, :favorite_tracks
  end
end
