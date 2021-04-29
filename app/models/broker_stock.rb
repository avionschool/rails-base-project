class BrokerStock < ApplicationRecord
  validates :user_id, :ticker, :company, :price, presence: true

  belongs_to :user
end
