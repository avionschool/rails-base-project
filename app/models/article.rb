class Article < ApplicationRecord
  validates :caption, presence: true
  belongs_to :nutritionist
  has_many :acomments, dependent: :destroy
end
