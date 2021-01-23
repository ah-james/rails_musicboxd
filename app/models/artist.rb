class Artist < ApplicationRecord
    has_many :albums

    validates :artist_name, presence: true
    validates :artist_name, uniqueness: true
    before_save :make_title_case

    private

    def make_title_case
        self.artist_name = self.artist_name.titlecase
    end
end
