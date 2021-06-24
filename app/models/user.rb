class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :default_approved
  after_create :send_welcome_email

  def default_approved
    self.approved ||= type != 'Broker'
  end

  def send_welcome_email
    WelcomeMailer.send_welcome_email(self).deliver
  end
end
