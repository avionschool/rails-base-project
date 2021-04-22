class Stock < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'buyers_stocks'
  has_many :transactions, dependent: :nullify

  validates :volume, numericality: { greater_than_or_equal_to: 0 }
  validates :code, uniqueness: true
  # Returns true if the stock code exists, false otherwise
  def self.exists?(code)
    !!find_by(code: code)
  end

  def check_total
    self.volume = BuyersStock.total_stock(self)
    save
  end
end
