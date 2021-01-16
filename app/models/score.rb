class Score < ApplicationRecord
    belongs_to :review
    has_many :albums, through: :reviews
end
