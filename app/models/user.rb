class User < ApplicationRecord
    has_many :reviews
    has_many :albums, through: :reviews
    has_many :tracks, through: :reviews
    has_secure_password

    validates :name, presence: true
    validates :name, length: { minimum: 3 }
    validates :email, uniqueness: true
    validates :password, length: { in: 5..10}
end
