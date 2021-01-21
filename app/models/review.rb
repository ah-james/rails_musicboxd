class Review < ApplicationRecord
    belongs_to :album
    belongs_to :user
    has_many :tracks
end
