require 'rails_helper'

RSpec.describe Trade, type: :model do
  context 'when validating associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:stock).with_foreign_key('stock_code') }
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:stock_code) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:transaction_type) }
    it { is_expected.to validate_presence_of(:total_price) }
  end

  context 'when validating acceptable values for numerals' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end

  context 'when validating enum for transaction_type' do
    subject(:trade) { described_class.new }

    it 'defines enum for transaction_types' do
      expect(trade).to define_enum_for(:transaction_type).with_values(buy: 0, sell: 1)
    end
  end
end
