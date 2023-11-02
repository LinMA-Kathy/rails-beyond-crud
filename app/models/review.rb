class Review < ApplicationRecord
  belongs_to :restaurant
  # if I have a review, then I can do review.restaurant
  validates :content, presence: true
end
