class TeacherSubject < ApplicationRecord
  belongs_to :rc_teacher
  belongs_to :subject

  validates :rc_teacher_id, presence: true
  validates :subject_id, presence: true
end
