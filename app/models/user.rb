class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requester_gift_requests, foreign_key: "requester_id", class_name: 'Gift_request'
  has_many :shopper_gift_requests, foreign_key: "shopper_id", class_name: 'Gift_request'
end
