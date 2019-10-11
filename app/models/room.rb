class Room < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy



  #room通知の作成メソッド
	def create_notification_room!(current_user, room_id)
		#その商品を同ユーザーがやりとりしていないとき、通知作成
		temp = Notification.where(["visitor_id = ? and visited_id = ? and product_id = ? and action = ?",
		buyer_id, seller_id, product_id, 'make_room'])
		if temp.blank?
			notification = current_user.active_notifications.new(
			product_id: product_id,
			visited_id: seller_id,
			room_id: id,
			action: 'make_room')
			if notification.visitor_id = notification.visited_id
				notification.checked = true
			end
			notification.save if notification.valid?
		end
  	end
end
