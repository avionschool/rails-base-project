class Item < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  has_many_attached :images
  belongs_to :user
  has_many :conversations, dependent: :destroy
  has_many :comments, dependent: :destroy
end
