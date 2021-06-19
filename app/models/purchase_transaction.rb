class PurchaseTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :broker
end
