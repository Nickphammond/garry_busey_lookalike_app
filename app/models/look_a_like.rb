class LookALike < ApplicationRecord

    has_one :user

    has_many :images_look_a_likes, dependent: :destroy 
    has_many :images, through: :images_look_a_likes 
    has_many_attached :images

    has_many :events_look_a_likes
    has_many :events, through: :events_look_a_likes

    has_many :suburbs_areas
    has_many :suburbs, through: :suburbs_areas

    accepts_nested_attributes_for :user, :events, :images
end
