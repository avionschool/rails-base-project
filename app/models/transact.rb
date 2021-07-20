class Transact < ApplicationRecord
  belongs_to :item
  has_many :reviews
end
