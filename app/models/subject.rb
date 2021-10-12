class Subject < ApplicationRecord
  belongs_to :course
  has_many :teacher_subjects, dependent: :destroy

  validates :name, presence: true
  validates :course_id, presence: true
end
