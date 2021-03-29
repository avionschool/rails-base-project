class Review < ApplicationRecord
  has_one_attached :avatar
  validates :title, presence: true
  validates :rating, presence: true,
                    numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :body, presence: true
  
  belongs_to :service
  belongs_to :buyer
end
