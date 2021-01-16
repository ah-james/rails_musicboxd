class User < ApplicationRecord
    has_many :albums
    has_many :reviews, through: :albums
end
