class Role < ApplicationRecord
  TYPES = %w[Buyer Broker Admin].freeze
  validates :name, inclusion: { in: TYPES }
  validates :name
  has_many :users, dependent: :nullify
end
