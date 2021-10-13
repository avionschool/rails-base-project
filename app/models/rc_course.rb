class RcCourse < ApplicationRecord
  belongs_to :review_center
  belongs_to :course
  has_many :lessons, dependent: :destroy
end
