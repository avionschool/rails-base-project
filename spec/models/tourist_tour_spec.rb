require 'rails_helper'

RSpec.describe TouristTour, type: :model do
  let!(:tourist_tour) { described_class.new }

  context 'with validations' do
    it 'must have a valid guest quantity' do
      expect(tourist_tour).to validate_numericality_of(:guest_quantity).is_greater_than_or_equal_to(1)
    end

    it 'must have a valid amount bought' do
      expect(tourist_tour).to validate_numericality_of(:amount_bought).is_greater_than_or_equal_to(0)
    end
  end
end
