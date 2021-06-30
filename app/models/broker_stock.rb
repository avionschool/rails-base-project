class BrokerStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  has_many :transactions, dependent: :destroy
  has_many :buyers, -> { where(users: { user_type_id: UserType.find_by(user_type: 'buyer').id }) }, through: :transactions, source: :user
  # Validations
  validates :stock_id, uniqueness: {scope: :user_id}
end
