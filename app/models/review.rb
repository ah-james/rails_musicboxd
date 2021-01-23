class Review < ApplicationRecord
    belongs_to :album
    belongs_to :user
    has_one :track
    # accepts_nested_attributes_for :track

    validates :score, presence true
    validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

    def track_attributes=(track_attributes)
        if track
            self.track.delete
        end
        self.build_track(track_attributes)
    end
end
