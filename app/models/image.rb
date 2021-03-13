class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_one :user

  has_many :images_look_a_likes
  has_many :look_a_likes, through: :images_look_a_likes
end
