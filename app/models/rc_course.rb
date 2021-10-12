class RcCourse < ApplicationRecord
  belongs_to :review_center
  belongs_to :course
  has_many :lessons, dependent: :destroy

  validates :review_center_id, presence: true
  validates :course_id, presence: true
end
