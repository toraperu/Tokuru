class Bank < ApplicationRecord
  belongs_to :user

  enum name:{ mitubishi: 0, mituisumitomo: 1, mizuho: 2, risona: 3}
end
