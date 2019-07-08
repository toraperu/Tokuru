class Product < ApplicationRecord

	belongs_to :genre
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	attachment :jacket_image


	def favorited_by?(user) #いいねしているかどうか
	    favorites.where(user_id: user.id).exists?
	end

	def commented_by(user) #コメントしてるかどうか
		comments.where(user_id: user.id).exists?
	end
end
