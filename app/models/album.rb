class Album < ApplicationRecord
    belongs_to :artist
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :artist

    validates :title, presence: true
    before_save :make_title_case

    private

    def make_title_case
        self.title = self.title.titlecase
    end
end
