class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :gift_request
end
