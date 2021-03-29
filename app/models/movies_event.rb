
class MoviesEvent < ApplicationRecord
    belongs_to :event
    belongs_to :movie

    accepts_nested_attributes_for :movie
    accepts_nested_attributes_for :event
end