class Suburb < ApplicationRecord
    has_many :addresses
    has_many :suburbs_look_a_likes
    has_many :look_a_likes, through: :suburbs_look_a_likes

    accepts_nested_attributes_for :look_a_likes
end
