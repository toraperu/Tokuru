class Message < ApplicationRecord
	after_create_commit { MessageBroadcastJob.perform_later self }

	belongs_to :from, class_name: "User"
	belongs_to :to, class_name: "User"
	belongs_to :room
	has_many :notifications, dependent: :destroy

	validates :from_id, presence: true
	validates :to_id, presence: true
	validates :room_id, presence: true
	validates :content, presence: true, length: {maximum: 50}




	#メッセージ通知機能(action_cable作成時、コントローラーを使ってないので実装困難)
	# def create_notification_message!(from_user, message_id)
	# 	temp_ids = Message.select(:to).where(room_id: room_id).distinct
	# 	temp_id.each do |temp_id|
	# 		save_notification_message!(from_id, message_id, temp_id['to'])
	# 	end
	# end



	# def save_notification_message!(from_user, message_id, visited_id)
	# 	notification = to.active_notification.build(
	# 		product_id: product_id,
	# 		message_id: message_id,
	# 		visited_id: visited_id,
	# 		action: "exist_message")
	# 	if notification.visitor_id == notification.visited_id
	# 		notification.checked = true
	# 	end
	# 	notification.save if notification.valid?
end
