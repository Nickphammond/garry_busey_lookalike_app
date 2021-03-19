class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  belongs_to :address, optional: true
  belongs_to :look_a_like, optional: true
  belongs_to :image, optional: true

  has_many :events

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :look_a_like, update_only: true
  accepts_nested_attributes_for :image

  has_one_attached :image
  
end
