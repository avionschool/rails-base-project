require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:review) { described_class.new }


  context 'with validations' do
    it 'must have a valid rating' do
      expect(review).to validate_numericality_of(:rating).is_greater_than_or_equal_to(0)
    end
  end

  context 'with validations of relationship' do
    it 'belongs to agency' do
      expect(review).to belong_to(:agency)
    end

    it 'belongs to a tourist' do
      expect(review).to belong_to(:tourist)
    end
  end
end
