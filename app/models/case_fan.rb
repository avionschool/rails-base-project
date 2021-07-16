class CaseFan < ApplicationRecord
  has_many :build_case_fans, dependent: :destroy
  has_many :builds, through: :build_case_fans
end
