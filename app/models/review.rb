class Review < ApplicationRecord
  belongs_to :transact

  validates :description, presence: true
end
