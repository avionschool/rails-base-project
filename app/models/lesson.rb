class Lesson < ApplicationRecord
  belongs_to :rc_course
  belongs_to :teacher_subject

  validates :name, presence: true
  validates :teacher_subject_id, presence: true
  validates :rc_course_id, presence: true
  validates :price, presence: true
end
