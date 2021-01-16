class Artist < ApplicationRecord
    has_many :tracks
    belongs_to :album
end
