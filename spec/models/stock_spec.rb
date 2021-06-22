require 'rails_helper'

RSpec.describe Stock, type: :model do
  let!(:stock) { described_class.create(symbol: 'MC', price: 260.76, company_name: 'Microsoft Corp') }

  context 'with validations/stock should fail to save' do
    it 'is not valid without symbol' do
      stock.symbol = nil

      expect(stock).not_to be_valid
    end

    it 'is not valid without a company_name' do
      stock.company_name = nil

      expect(stock).not_to be_valid
    end
  end
end
