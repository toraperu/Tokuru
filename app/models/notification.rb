class Notification < ApplicationRecord
	default_scope ->{ order(created_at: :desc) }
	belongs_to :product, optional: true
	belongs_to :message, optional: true
	belongs_to :order, optional: true

	belongs_to :visitior, class_name: 'User', foreign_key: 'visitor_id', optional: true
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
