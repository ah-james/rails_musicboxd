class Album < ApplicationRecord
    belongs_to :artist
    has_many :reviews
    has_many :users, through: :reviews
    # accepts_nested_attributes_for :artist

    validates :title, presence: true
    validates :title, uniqueness: { message: "Album has already been created, please enter a review through the album's page"}
    before_save :make_title_case

    scope :alphabetize_by_title, -> {order(:title)}

    scope :order_by_artist_name, -> {joins(:artist).order(:artist_name)}

    def artist_attributes=(artist)
        self.artist = Artist.find_or_create_by(artist_name: artist[:artist_name])
        self.artist.update(artist)
    end

    private

    def make_title_case
        self.title = self.title.titlecase
    end
end
