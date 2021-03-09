class LookALike < ApplicationRecord

    has_many :users

    has_many :events_look_a_likes
    has_many :events, through: :events_look_a_likes

    has_many :suburbs_areas
    has_many :suburbs, through: :suburbs_areas
end
