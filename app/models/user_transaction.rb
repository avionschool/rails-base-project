class UserTransaction < ApplicationRecord
  belongs_to :buyer
  belongs_to :broker_stock
end
