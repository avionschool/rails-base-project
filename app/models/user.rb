class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user_type
  has_many :broker_stocks, dependent: :destroy
  has_many :stocks, through: :broker_stock
  has_many :transactions, dependent: :destroy
  has_many :buyer_stocks, through: :transactions, source: :broker_stock
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
