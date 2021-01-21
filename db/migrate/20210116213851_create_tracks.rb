class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_tracks do |t|
      t.string :track_title
      t.integer :artist_id

      t.timestamps
    end
  end
end
