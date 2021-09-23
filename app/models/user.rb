class User < ApplicationRecord
  has_many :trades, dependent: :destroy
  has_many :stocks, through: :trades
  has_many :user_stocks, dependent: :destroy
  has_one :wallet, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :confirmable

  enum role: { user: 0, admin: 1 }
  enum status: { pending: 0, approved: 1 }
end
