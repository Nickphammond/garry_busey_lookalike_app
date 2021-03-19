class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_one :user

  has_one :look_a_like
end
