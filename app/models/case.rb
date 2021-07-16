class Case < ApplicationRecord
  has_many :builds, dependent: :destroy
end
