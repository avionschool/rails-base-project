class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :rc_courses, dependent: :destroy

  validates :name, presence: true
end
