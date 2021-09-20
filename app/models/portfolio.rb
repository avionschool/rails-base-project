class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :sample_stocks, dependent: :nullify

  def new
    @portfolio = @sample_stock.portfolios.build
    @sample_stocks = SampleStock.all
    @use_id = params[:user_id]
  end
end
