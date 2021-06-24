require 'rails_helper'

RSpec.describe UserStock, type: :model do
  let!(:user_stock) { described_class.new }

  context 'with validations of relationship' do
    it 'belongs to stock' do
      expect(user_stock).to belong_to(:stock)
    end

    it 'belongs to a user' do
      expect(user_stock).to belong_to(:user)
    end
  end

  context 'with validation of buyer_stocks' do
    before { allow(user_stock).to receive(:user_buyer?).and_return(true) }

    it 'onlies accept possitive average price if user = buyer' do
      expect(user_stock).to validate_numericality_of(:average_price).is_greater_than(0)
    end

    it 'has a possitive total shares if user = buyer' do
      expect(user_stock).to validate_numericality_of(:total_shares).is_greater_than(0)
    end
  end
end
