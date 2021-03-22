class EventsLookALike < ApplicationRecord
    belongs_to :event
    belongs_to :look_a_like
    belongs_to :movie, optional: true

    accepts_nested_attributes_for :look_a_like
    accepts_nested_attributes_for :event
end








