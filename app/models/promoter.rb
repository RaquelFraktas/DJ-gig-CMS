class Promoter < ActiveRecord::Base
    has_many :gigs
    has_many :djs, through: :gigs
    validates_presence_of :username
    has_secure_password
    validates :username, uniqueness: true
    validates :password, length: { in: 6..60 }, if: -> { password.present? }

end
