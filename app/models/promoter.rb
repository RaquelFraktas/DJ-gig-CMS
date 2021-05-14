class Promoter < ActiveRecord::Base
    has_many :gigs
    has_many :djs, through: :gigs
    validates_presence_of :username
    has_secure_password

end
