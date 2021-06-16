class Stock < ApplicationRecord
  has_many :broker_stocks 
end
