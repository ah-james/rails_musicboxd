class Artist < ApplicationRecord
    has_many :albums

    validates :artist_name, presence: true
    validates :artist_name, uniqueness: true
    validate :no_more_tekashi
    before_save :make_title_case

    scope :alphabetize_by_name, -> {order(:artist_name)}

    private

    def make_title_case
        self.artist_name = self.artist_name.titlecase
    end

    def no_more_tekashi
        if self.artist_name == "Tekashi69"
            errors.add(:artist_name, "Please don't put that in my database")
        end
    end
end
