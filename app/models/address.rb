class Address < ApplicationRecord
  has_many :users
  has_many :events
  belongs_to :suburb, optional: true

  accepts_nested_attributes_for :users, :events
  accepts_nested_attributes_for :suburb
end
