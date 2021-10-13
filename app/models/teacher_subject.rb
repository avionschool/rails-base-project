class TeacherSubject < ApplicationRecord
  belongs_to :rc_teacher
  belongs_to :subject
end
