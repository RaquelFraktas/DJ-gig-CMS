class Gig < ActiveRecord::Base
    has_many :djs
    belongs_to :booking_agent
end
