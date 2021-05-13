class Dj < ActiveRecord::Base
    has_many :genres
    has_many :gigs
    has_many :promoters, through: :gigs
    validates_presence_of :username, :password_digest
end
