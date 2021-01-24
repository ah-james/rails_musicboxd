class Track < ApplicationRecord
    belongs_to :review
    before_save :make_title_case

    private

    def make_title_case
        self.track_title = self.track_title.titlecase
    end
end
