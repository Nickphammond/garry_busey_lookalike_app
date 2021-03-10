class EventsLookALike < ApplicationRecord
    belongs_to :event
    belongs_to :look_a_like
    belongs_to :movie
end