require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  let!(:portfolio) { Portfolio.new(amount: '50.05') }
  it "must have a market symbol" do
    portfolio.user_id = 1
    portfolio.hist_price = 500
    portfolio.market_symbol = nil

    expect(portfolio).not_to be_valid
  end

  it "must have a history price" do
    portfolio.user_id = 1
    portfolio.hist_price = nil
    portfolio.market_symbol = 'AAA'

    expect(portfolio).not_to be_valid
  end

  it "must have a user id" do
    portfolio.user_id = nil
    portfolio.hist_price = '50.0'
    portfolio.market_symbol = 'AAA'

    expect(portfolio).not_to be_valid
  end
end
