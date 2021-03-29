class Event < ApplicationRecord
    validates_presence_of :address

    belongs_to :address
    belongs_to :user

    has_many :events_look_a_likes, dependent: :destroy 
    has_many :look_a_likes, through: :events_look_a_likes

    has_many :movies_events, dependent: :destroy 
    has_many :movies, through: :movies_events

    accepts_nested_attributes_for :address
    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :look_a_likes
    accepts_nested_attributes_for :movies
end






