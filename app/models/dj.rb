class Dj < ActiveRecord::Base
    has_many :genres
    has_many :gigs
    # has_many :booking_agents, through: :gigs
end
