class Mobo < ApplicationRecord
  has_many :builds, dependent: :destroy
end
