class Transaction < ApplicationRecord
  belongs_to :broker
  belongs_to :stock
  belongs_to :buyer
end