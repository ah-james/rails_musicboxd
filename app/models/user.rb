class User < ApplicationRecord
    has_many :reviews
    has_many :albums, through: :reviews
    has_many :tracks, through: :reviews
    has_secure_password

    validates :name, presence: true
    validates :name, format: { without: /[0-9]/ }
    validates :email, uniqueness: true
end
