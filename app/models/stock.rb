class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :nullify
  has_many :users, through: :user_stocks, dependent: :nullify
  has_many :transactionrecords, dependent: :nullify
end
