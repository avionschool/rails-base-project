class Broker < User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
