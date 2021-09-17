class User < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :stocks, through: :user_stocks
  has_many :wallets, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  validate :validate_username

  def login
    @login = username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).find_by(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }])
    elsif conditions.key?(:username) || conditions.key?(:email)
      find_by(conditions.to_h)
    end
  end

  def validate_username
    return if User.find_by(email: username).nil?
    return errors.add(:username, :invalid) if User.find_by(email: username).exists?
  end

  def admin?
    admin = Role.find_by(name: 'admin').id
    roles.exists?(admin)
  end

  def trader?
    trader = Role.find_by(name: 'trader').id
    roles.exists?(trader)
  end

  private

  def set_default_role
    roles << Role.find_by(name: 'trader') if roles.empty?
  end

end
