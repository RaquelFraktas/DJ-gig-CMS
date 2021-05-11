class BookingAgent < ActiveRecord::Base
    has_many :gigs
    # has_many :djs, through: gigs

end
