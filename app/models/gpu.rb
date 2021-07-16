class Gpu < ApplicationRecord
  has_many :build_gpus, dependent: :destroy
  has_many :builds, through: :build_gpus
end
