class GiftRequest < ApplicationRecord
  belongs_to :requester, foreign_key: :requester_id, class_name: 'User'
  belongs_to :shopper, foreign_key: :shopper_id, class_name: 'User', optional: true
end
