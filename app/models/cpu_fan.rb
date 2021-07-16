class CpuFan < ApplicationRecord
  has_many :builds, dependent: :destroy
end
