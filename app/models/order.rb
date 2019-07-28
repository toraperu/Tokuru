class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum contact: { LINE: 0, SKYPE: 1, TEL: 2, その他: 3 }
  enum payment: {credit: 0, skill: 1 }
end
