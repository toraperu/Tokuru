class Bank < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :branch, presence: true
  validates :number, presence: true
  validates :holder, presence: true

  enum name:{ mitubishi: 0, mituisumitomo: 1, mizuho: 2, risona: 3}
end
