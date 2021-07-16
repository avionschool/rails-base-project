class Agency < User
  has_many :tours, dependent: :nullify
  has_many :travel_transactions, dependent: :nullify

  has_many :reviews, dependent: :nullify
end
