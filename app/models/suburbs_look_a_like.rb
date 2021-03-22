class SuburbsLookALike < ApplicationRecord
    belongs_to :suburb
    belongs_to :look_a_like

    accepts_nested_attributes_for :look_a_like
    accepts_nested_attributes_for :suburb
  end