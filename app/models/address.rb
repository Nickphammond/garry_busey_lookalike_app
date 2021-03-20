class Address < ApplicationRecord
  validates_presence_of :street_number
  validates_presence_of :street_name
  validates_presence_of :address_postcode_exists

  def address_postcode_exists

    if self.suburb != nil
      if self.suburb.postcode != nil
        return true
      else
        return false
      end
    end
  
  end

  has_many :users
  has_many :events
  belongs_to :suburb, optional: true

  accepts_nested_attributes_for :users, :events
  accepts_nested_attributes_for :suburb
end


private



