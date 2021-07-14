class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :food
  belongs_to :article
end
