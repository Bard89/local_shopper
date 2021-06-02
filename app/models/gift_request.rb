class GiftRequest < ApplicationRecord
  belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
  belongs_to :shopper, foreign_key: :shopper_id, class_name: 'User', optional: true

  has_one :chatroom # every gift_request has only one chatroom -> gives me access

  validates :recipient_name, presence: true
  validates :recipient_address, presence: true
  validates :products, presence: true
end
