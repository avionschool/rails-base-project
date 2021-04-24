class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthablel

  validates :role_id, :firstname, :lastname, :email, :password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :role 

  has_many :transactions,dependent: :destroy_async
  has_many :buyer_stocks,dependent: :destroy_async
  has_many :broker_stocks,dependent: :destroy_async

end
