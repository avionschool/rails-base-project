class Buyer < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, authentication_keys: [:username]
  validates :username, uniqueness: true

  before_create :approved_is_true
  def approved_is_true
    self.approved = true
  end
end
