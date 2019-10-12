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
	has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
	has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

	#チャット機能のための関連付け
	has_many :from_messages, class_name: "Message",
			 foreign_key: "from_id", dependent: :destroy
	has_many :to_messages, class_name: "Message",
	  		 foreign_key: "to_id", dependent: :destroy
	has_many :sent_messages, through: :from_messages, source: :from
	has_many :received_messages, through: :to_messages, source: :to
	has_many :buyer_rooms, class_name: "Room", foreign_key: 'buyer_id', dependent: :destroy
	has_many :seller_rooms, class_name: "Room", dependent: :destroy

	#attachment :profile_image
	#active storage使用
	has_one_attached :avatar


	#チャット機能でメッセージを送信するためのメソッド
	def send_message(other_user, room_id, content)
		from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
	end



end
