class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates :body, presence: true, length: { in: 1..300}
end
