class Article < ApplicationRecord
  validates :caption, presence: true
  belongs_to :nutritionist
  has_many :comments, dependent: :destroy
end
