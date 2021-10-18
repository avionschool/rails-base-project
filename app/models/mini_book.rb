class MiniBook < ApplicationRecord
  has_many :checkouts, dependent: :destroy
end
