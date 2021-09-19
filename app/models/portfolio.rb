class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :sample_stock
end
