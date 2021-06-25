class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :nullify
  has_many :users, through: :user_stocks, dependent: :nullify
  has_many :transactionrecords, dependent: :nullify
  before_create :upcase_ticker
  validates :ticker, presence: true, length: { minimum: 1, maximum: 5 }, uniqueness: true

  def upcase_ticker
    ticker&.upcase!
  end
end
