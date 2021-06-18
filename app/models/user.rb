class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stocks, dependent: :destroy
  has_many :buyerStocks, dependent: :destroy
  has_many :transactions, dependent: :nullify
end
