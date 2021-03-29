class Movie < ApplicationRecord
    has_many :events_look_a_likes

    has_many :movies_events, dependent: :destroy 
    has_many :events, through: :movies_events
end
