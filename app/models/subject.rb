class Subject < ApplicationRecord
  belongs_to :course
  has_many :teacher_subjects, dependent: :destroy

  validates :name, presence: true
end
