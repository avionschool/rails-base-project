class RcTeacher < ApplicationRecord
  # belongs_to :user
  belongs_to :review_center
  has_many :teacher_subjects, dependent: :destroy
end
