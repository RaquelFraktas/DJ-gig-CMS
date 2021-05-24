class Gig < ActiveRecord::Base
    has_and_belongs_to_many :djs
    belongs_to :promoter
    validates_presence_of :promoter
end
