class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #   def broker?
  #     type == 'Broker'
  #   end

  #   def buyer?
  #     type == 'Buyer'
  #   end
end
