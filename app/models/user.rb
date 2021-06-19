class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable

  def admin?
    type == 'Admin'
  end

  def broker?
    type == 'Broker'
  end

  def buyer?
    type == 'Buyer'
  end
end
