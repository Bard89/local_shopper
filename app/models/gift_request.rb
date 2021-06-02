class GiftRequest < ApplicationRecord
  belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
  belongs_to :shopper, foreign_key: :shopper_id, class_name: 'User', optional: true

  validates :status, presence: true
  STATUSES = [:pending, :accepted, :purchased, :paid, :delivered]

  validates :recipient_name, presence: true
  validates :recipient_address, presence: true
  validates :products, presence: true
end
