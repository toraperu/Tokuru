class Product < ApplicationRecord

	belongs_to :genre
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	attachment :jacket_image

	validates :name, presence: true, length: {in: 1..13}
	validates :price, presence: true
	validates :body, presence: true, length: {in: 1..200}

	#販売中のスコープ genre/show, product/indexに使用
	scope :at_sale, -> { where(finish: false) }

	def favorited_by?(user) #いいねしているかどうか
	    favorites.where(user_id: user.id).exists?
	end

	def commented_by?(user) #コメントしてるかどうか
		comments.where(user_id: user.id).exists?
	end


	#検索窓設置
	def self.search(search) #self.でクラスメソッドとしている
		if search
		  Product.where(['name LIKE ?', "%#{search}%"])
		else
		  Product.at_sale #販売中のものを全て表示。
		end
	end
end
