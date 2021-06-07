class GiftRequest < ApplicationRecord
  belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
  belongs_to :shopper, foreign_key: :shopper_id, class_name: 'User', optional: true


  has_one :chatroom # every gift_request has only one chatroom -> gives me access

  validates :status, presence: true
  STATUSES = [:purchased, :paid, :delivered]

  validates :recipient_name, presence: true
  validates :recipient_address, presence: true

  # to enable the monetisation -> just sayin wchich column is the price
  monetize :price_cents
end
