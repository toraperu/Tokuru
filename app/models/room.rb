class Room < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_many :messages, dependent: :destroy
end
