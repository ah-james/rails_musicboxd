class Album < ApplicationRecord
    belongs_to :artist
    has_many :reviews
    has_many :users, through: :reviews
    # accepts_nested_attributes_for :artist

    validates :title, presence: true
    validates :title, uniqueness: true
    before_save :make_title_case

    def artist_attributes=(artist)
        self.artist = Artist.find_or_create_by(artist_name: artist[:artist_name])
        self.artist.update(artist)
    end

    private

    def make_title_case
        self.title = self.title.titlecase
    end
end
