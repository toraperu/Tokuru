class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :notifications, dependent: :destroy


  validates :contact, presence: true
  validates :contact_info, presence: true
  validates :payment, presence: true

  enum contact: { LINE: 0, SKYPE: 1, TEL: 2, その他: 3 }
  enum payment: {credit: 0, skill: 1 }





  #購入された商品の通知メソッド
  def create_order_notification!(current_user, order_id)
  	temp = Notification.where(["visitor_id = ? and visited_id = ? and product_id = ? and action = ?", 
  	current_user.id, user_id, product_id, "make_order"])
  	if temp.blank?
  		notification = current_user.active_notifications.new(
  			product_id: product_id,
  			order_id: id,
  			visited_id: product.user_id,
  			action: "make_order"
  			)
  		notification.save if notification.valid?
  	end
  end


end
