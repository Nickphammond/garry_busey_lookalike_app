class Event < ApplicationRecord

    belongs_to :address

    belongs_to :user

    has_many :events_look_a_likes
    has_many :look_a_likes, through: :events_look_a_likes
end
