class Item < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  belongs_to :user, class_name: 'User'
  has_many :conversations, dependent: :destroy
  has_many :comments, dependent: :restrict_with_exception
  
end
