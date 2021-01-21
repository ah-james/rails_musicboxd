class FavoriteTrack < ApplicationRecord
    belongs_to :review
    accepts_nested_attributes_for :review
end
