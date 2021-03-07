class Suburb < ApplicationRecord
    has_many :addresses
    has_many :suburbs_areas
    has_many :look_a_likes, through: :suburbs_areas
end
