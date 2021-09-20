class Portfolio < ApplicationRecord
  has_many :sample_stocks, dependent: :nullify
  belongs_to :user

  def new
    @sample_stocks = SampleStock.all
  end
end
