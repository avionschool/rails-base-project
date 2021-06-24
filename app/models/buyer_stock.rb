class BuyerStock < ApplicationRecord
<<<<<<< HEAD
  belongs_to :buyer

=======
>>>>>>> Update broker and buyer stock validations
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
