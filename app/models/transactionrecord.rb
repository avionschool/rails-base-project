class Transactionrecord < ApplicationRecord
  enum transactiontype: { buy: 0, sell: 1, add: 2, remove: 3 }
  belongs_to :broker, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :stock
end
