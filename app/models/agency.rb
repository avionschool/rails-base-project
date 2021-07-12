class Agency < User
  has_many :tours, dependent: :destroy
  has_many :travel_transactions, dependent: :destroy

  has_many :reviews, dependent: :destroy
end
