require 'rails_helper'

RSpec.describe Transactionrecord, type: :model do
  let!(:transactionrecord) { described_class.new }

  context 'with validations of relationship' do
    it 'belongs to stock' do
      expect(transactionrecord).to belong_to(:stock)
    end

    it 'belongs to a buyer' do
      expect(transactionrecord).to belong_to(:buyer)
    end

    it 'belongs to a broker' do
      expect(transactionrecord).to belong_to(:broker)
    end
  end

  context 'with validation of buy and sell transaction' do
    before { allow(transactionrecord).to receive(:transaction_buy_or_sell?).and_return(true) }

    it 'only accept possitive stock price if transactiontype = buy ||  transactiontype = sell ' do
      expect(transactionrecord).to validate_numericality_of(:stock_price).is_greater_than(0)
    end

    it 'only accept possitive quantity if transactiontype = buy ||  transactiontype = sell ' do
      expect(transactionrecord).to validate_numericality_of(:quantity).is_greater_than(0)
    end

    it 'only accept possitive total_price if transactiontype = buy ||  transactiontype = sell ' do
      expect(transactionrecord).to validate_numericality_of(:total_price).is_greater_than(0)
    end
  end
end
