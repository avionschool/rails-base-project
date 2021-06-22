class User < ApplicationRecord
  # to declare an attribute where the values maps to integers in the Role table
  enum role: { broker: 0, buyer: 1, admin: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
