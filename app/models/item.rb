class Item < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  belongs_to :user
  has_many :comments
end
