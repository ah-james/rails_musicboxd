class Album < ApplicationRecord
    has_many :artists
    has_many :scores, through: :reviews
    belongs_to :user
end
