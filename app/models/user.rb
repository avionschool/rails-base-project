class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable, authentication_keys: [:username]
  validates :username, uniqueness: true

  def admin?
    type == 'Admin'
  end

  def broker?
    type == 'Broker'
  end

  def buyer?
    type == 'Buyer'
  end

  def will_save_change_to_email?
    false
  end
end
