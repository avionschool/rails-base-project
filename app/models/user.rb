class User < ApplicationRecord
  has_many :trades, dependent: :destroy
  has_many :stocks, through: :trades

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { user: 0, admin: 1 }
  enum status: { pending: 0, approved: 1 }
end
