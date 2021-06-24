require 'rails_helper'

RSpec.describe Stock, type: :model do
  let!(:stocks) { described_class.new }

  it 'is not valid without a symbol' do
    stocks.symbol = nil
    stocks.companyname = 'SampleCompany'
    expect(stocks).not_to be_valid
  end

  it 'is not valid without a companyname' do
    stocks.symbol = 'SC'
    stocks.companyname = nil
    expect(stocks).not_to be_valid
  end
end
