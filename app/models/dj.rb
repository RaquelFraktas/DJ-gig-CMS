class Dj < ActiveRecord::Base
    has_secure_password
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :gigs
    has_many :promoters, through: :gigs
    validates :username, uniqueness: true
    validates :password, length: { in: 6..60 }, if: -> { password.present? }
end
