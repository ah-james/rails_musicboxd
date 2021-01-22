class AddTrackIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :track_id, :integer
  end
end
