class LookALike < ApplicationRecord

    has_one :user

    # has_many :images
    has_many_attached :images

    has_many :events_look_a_likes
    has_many :events, through: :events_look_a_likes

    has_many :suburbs_look_a_likes
    has_many :suburbs, through: :suburbs_look_a_likes

    accepts_nested_attributes_for :user, :events, :suburbs
end
