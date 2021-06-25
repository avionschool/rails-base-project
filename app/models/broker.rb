class Broker < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]
  validates :username, uniqueness: true

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  after_create :send_admin_mail
  def send_admin_mail
    BrokerMailer.new_broker_account_pending(email).deliver
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end
end
