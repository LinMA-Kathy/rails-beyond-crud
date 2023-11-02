class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # if have a restaurant, I can do restaurant.reviews
  validates :name, presence: true
end
