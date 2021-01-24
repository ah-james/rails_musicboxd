class RemoveTrackIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :track_id, :integer
  end
end
