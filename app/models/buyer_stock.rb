class BuyerStock < ApplicationRecord
<<<<<<< HEAD
  belongs_to :buyer
=======
>>>>>>> 9d10ecd380fa071def519c2d32928b7495f0a432
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
