class RenameFavoriteTracksToTracks < ActiveRecord::Migration[6.1]
  def change
    rename_table :favorite_tracks, :tracks
  end
end
