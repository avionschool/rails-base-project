class Role < ApplicationRecord
  TYPES = %w[Buyer Broker Admin].freeze
  validates :name, inclusion: { in: TYPES }
  has_many :users, dependent: :nullify
end
