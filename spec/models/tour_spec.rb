require 'rails_helper'

RSpec.describe Tour, type: :model do
  let!(:tour) { described_class.new }

  context 'with validations' do
    it 'is not valid without name' do
      expect(tour).to validate_presence_of(:name)
    end

    it 'must have atlease 1 character' do
      expect(tour).to validate_length_of(:name)
        .is_at_least(1)
        .on(:create)
    end

    it 'is not valid without location' do
      expect(tour).to validate_presence_of(:location)
    end

    it 'must have at least 1 character' do
      expect(tour).to validate_length_of(:location)
        .is_at_least(1)
        .on(:create)
    end

    it 'must have a valid price' do
      expect(tour).to validate_numericality_of(:price).is_greater_than_or_equal_to(0)
    end

    it 'must have a valid duration' do
      expect(tour).to validate_numericality_of(:duration).is_greater_than_or_equal_to(1)
    end
  end

  context 'with validations of relationship' do
    it 'belongs to agency' do
      expect(tour).to belong_to(:agency)
    end
  end
end
