class Order < ApplicationRecord
  belongs_to :wallet
  belongs_to :coin

  validates :price, :quantity, presence:true
end