class BuyerService < ApplicationRecord
  belongs_to :service
  belongs_to :buyer
end
