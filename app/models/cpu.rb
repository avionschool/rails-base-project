class Cpu < ApplicationRecord
  has_many :builds, dependent: :destroy
end
