class Gig < ActiveRecord::Base
    has_many :djs
    belongs_to :promoter
    validates_presence_of :promoter
end
