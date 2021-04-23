class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  belongs_to :role
  has_many :stocks, dependent: :nullify
  has_many :markets, dependent: :destroy
  # has_many :transactions, through: :stocks
  
  has_many :sale, class_name: "Transaction", foreign_key: "seller_id", dependent: :nullify
  has_many :purchases, class_name: "Transaction", foreign_key: "buyer_id", dependent: :nullify
end
