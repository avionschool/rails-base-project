class User < ApplicationRecord
  after_initialize :set_default_role_and_status, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable

  enum role: { :user => 0, :admin => 1 }
  enum status: { :pending => 0, :approved => 1 }

  def set_default_role_and_status
    self.role ||= :user
    self.status ||= :pending
  end
end
