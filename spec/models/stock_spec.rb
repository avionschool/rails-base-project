require 'rails_helper'

RSpec.describe Stock, type: :model do
  let!(:stock) { described_class.new }

  context 'with validations' do
    it 'is not valid without ticker' do
      expect(stock).to validate_presence_of(:ticker)
    end

    it 'makes ticker uppercase' do
      stock = create(:stock, ticker: 'goog')
      expect(stock.ticker).to eq('GOOG')
    end

    it 'must have atlease 1 character' do
      expect(stock).to validate_length_of(:ticker)
        .is_at_least(1)
        .on(:create)
    end

    it 'must have atmost 5 character' do
      expect(stock).to validate_length_of(:ticker)
        .is_at_most(5)
        .on(:create)
    end

    it 'must be unique' do
      expect(stock).to validate_uniqueness_of(:ticker)
    end
  end
end
