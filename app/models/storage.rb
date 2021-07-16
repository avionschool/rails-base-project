class Storage < ApplicationRecord
  has_many :build_storages, dependent: :destroy
  has_many :builds, through: :build_storages
end
