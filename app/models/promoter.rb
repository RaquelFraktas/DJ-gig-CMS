class Promoter < ActiveRecord::Base
    has_many :gigs
    has_many :djs, through: :gigs
    validates_presence_of :username, :password_digest

end
