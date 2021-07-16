class Ram < ApplicationRecord
  has_many :build_rams, dependent: :destroy
  has_many :builds, through: :build_rams
end
