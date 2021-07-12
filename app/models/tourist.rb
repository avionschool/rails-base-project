class Tourist < User
  has_many :tourist_tours, dependent: :destroy
  has_many :tours, through: :tourist_tours

  has_many :travel_transactions, through: :tourist_tours

  has_many :reviews, dependent: :destroy
end
