class Album < ApplicationRecord
    belongs_to :artist
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :artists
end
