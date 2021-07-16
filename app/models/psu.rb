class Psu < ApplicationRecord
  has_many :builds, dependent: :destroy
end
