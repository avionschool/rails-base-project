class Comment < ApplicationRecord
  validates :commentor, presence: true
  validates :comment, presence: true
  belongs_to :food
  belongs_to :article
end
