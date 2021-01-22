class Review < ApplicationRecord
    belongs_to :album
    belongs_to :user
    has_one :track
    # accepts_nested_attributes_for :track

    def track_attributes=(track_attributes)
        self.track.delete
        self.build_track(track_attributes)
    end
end
