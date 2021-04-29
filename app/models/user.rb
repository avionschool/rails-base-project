class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthablel

  validates :role_id, :firstname, :lastname, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :transactions, dependent: :destroy_async
  has_many :buyer_stocks, dependent: :destroy_async
  has_many :broker_stocks, dependent: :destroy_async

  def self.find_db(user_id)
    find_by(id: user_id)
  end
end
