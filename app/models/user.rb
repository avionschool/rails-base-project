class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relations
  belongs_to :user_type
  has_many :broker_stocks, dependent: :destroy
  has_many :stocks, through: :broker_stocks
  has_many :transactions, dependent: :destroy
  has_many :buyer_stocks, through: :transactions, source: :broker_stock
  # Validation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :user_type_id, presence: true
  validates_associated :user_type
  validates :verified, inclusion: [true, false]
  # Scopes
  scope :buyers, -> { where(user_type_id: UserType.find_by(user_type: 'buyer').id) }
  scope :brokers, -> { where(user_type_id: UserType.find_by(user_type: 'broker').id) }
  scope :admins, -> { where(user_type_id: UserType.find_by(user_type: 'admin').id) }
  # Callbacks
  before_validation :set_user_verification
  # Private Methods

  private

  def set_user_verification
    return unless verified.nil?

    user_type = self.user_type.user_type
    self.verified = false if user_type == 'broker'
    self.verified = true if %w[buyer admin].include?(user_type)
  end
end
