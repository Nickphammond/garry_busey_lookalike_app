class ImagesLookALike < ApplicationRecord
    belongs_to :image
    belongs_to :look_a_like

    accepts_nested_attributes_for :look_a_like
    accepts_nested_attributes_for :image
end