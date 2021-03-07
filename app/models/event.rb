class Event < ApplicationRecord
    has_many :events_users
    has_many :users, through: :events_users

    has_many :events_look_a_likes
    has_many :look_a_likes, through: :events_look_a_likes
end
