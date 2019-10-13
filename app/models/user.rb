class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :validatable

	has_many :products
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :orders
	has_one :bank, dependent: :destroy
	#通知機能のための関連付け
	has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
	has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
	#フォロー機能のための関連付け
	has_many :relationships
	has_many :followings, through: :relationships, source: :follow
	has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
	has_many :followers, through: :reverse_of_relationships, source: :user

	#チャット機能のための関連付け
	has_many :from_messages, class_name: "Message",
			 foreign_key: "from_id", dependent: :destroy
	has_many :to_messages, class_name: "Message",
	  		 foreign_key: "to_id", dependent: :destroy
	has_many :sent_messages, through: :from_messages, source: :from
	has_many :received_messages, through: :to_messages, source: :to
	has_many :buyer_rooms, class_name: "Room", foreign_key: 'buyer_id', dependent: :destroy
	has_many :seller_rooms, class_name: "Room", foreign_key: 'seller_id', dependent: :destroy

	#attachment :profile_image
	#active storage使用
	has_one_attached :avatar


	#チャット機能でメッセージを送信するためのメソッド
	def send_message(other_user, room_id, content)
		from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
	end




	#フォローメソッド
	def follow(other_user)
		unless self == other_user
			self.relationships.find_or_create_by(follow_id: other_user.id)
		end
	end

	#フォロー解除メソッド
	def unfollow(other_user)
		relationship = self.relationships.find_by(follow_id: other_user.id)
		relationship.destroy if relationship
	end

	#すでにフォローしていないかチェック
	def following?(other_user)
		self.followings.include?(other_user)
	end





	#フォロー通知機能
	def create_notification_follow!(current_user)
		temp = Notification.where(["visited_id = ? and visitor_id = ? and action = ?", id, current_user.id, 'follow_user' ])
		if temp.blank?
			notification = current_user.active_notifications.build(
				visited_id: id,
				action: 'follow_user'
				)
			notification.save if notification.valid?
		end
	end









end
