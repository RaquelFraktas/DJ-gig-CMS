class Gig < ActiveRecord::Base
    has_many :djs
    belongs_to :promoter
end
