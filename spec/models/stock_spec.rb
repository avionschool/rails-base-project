require 'rails_helper'

RSpec.describe Stock, type: :model do
  let!(:stock) {described_class.new}

  context 'with validations/stock should fail to save' do
    it 'is not valid without symbol' do
      stock.symbol = nil
      stock.price = 260.76
      stock.company_name = 'Microsoft Corp'
      stock.save

      expect(stock.errors.to_h.keys).to include(:symbol)
    end
  end
end
