class AbcProduct < ApplicationRecord
  validates :product_name, presence: true

  scope :free, -> { where(user_status: 0) }
  scope :paid, -> { where(user_status: 1) }
end
