class Build < ApplicationRecord
  belongs_to :user
  has_one :cpus, dependent: :destroy
  has_one :mobos, dependent: :destroy
  has_one :psus, dependent: :destroy
  has_one :cases, dependent: :destroy
  has_one :cpu_fans, dependent: :destroy
  has_many :gpus, dependent: :destroy
  has_many :rams, dependent: :destroy
  has_many :storages, dependent: :destroy
  has_many :case_fans, dependent: :destroy
end
