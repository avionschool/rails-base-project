require 'rails_helper'

RSpec.describe TravelTransaction, type: :model do
  let!(:travel_transaction) { described_class.new }

  context 'with validations' do
    it 'must have a valid amount bought' do
      expect(travel_transaction).to validate_numericality_of(:total_price).is_greater_than_or_equal_to(1)
    end
  end

  context 'with validations of relationship' do
    it 'belongs to tourist tour' do
      expect(travel_transaction).to belong_to(:tourist_tour)
    end

    it 'belongs to a agency' do
      expect(travel_transaction).to belong_to(:agency)
    end
  end
end
