class User < ApplicationRecord
  # to declare an attribute where the values maps to integers in the Role table
  enum role: { broker: 0, buyer: 1, admin: 2 }
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks, dependent: :nullify
  has_many :broker_transactionrecords, class_name: 'Transactionrecord', foreign_key: 'broker_id', inverse_of: 'transactionrecord', dependent: :nullify
  has_many :buyer_transactionrecords, class_name: 'Transactionrecord', foreign_key: 'buyer_id', inverse_of: 'transactionrecord', dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
