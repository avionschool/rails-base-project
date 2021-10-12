class RcTeacher < ApplicationRecord
  # belongs_to :user
  belongs_to :review_center
  has_many :teacher_subjects, dependent: :destroy

  validates :review_center_id, presence: true
end
