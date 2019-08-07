class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product


  validates :contact, presence: true
  validates :contact_info, presence: true
  validates :payment, presence: true

  enum contact: { LINE: 0, SKYPE: 1, TEL: 2, その他: 3 }
  enum payment: {credit: 0, skill: 1 }
end
