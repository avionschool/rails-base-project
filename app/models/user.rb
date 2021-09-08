class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable

  enum role: { user: 0, admin: 1 }
  enum status: { pending: 0, approved: 1 }
end
