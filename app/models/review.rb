class Review < ApplicationRecord
  belongs_to :gift_request

  validates :rating, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  validates :review, presence: true
end
