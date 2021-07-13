require 'rails_helper'

RSpec.describe FoodGroup, type: :model do
  let(:food_group) { described_class.create(name: 'bread', food_name: 'Pizza') }

  describe 'Validations' do
    it 'is not valid without a name' do
      food_group.name = nil
      expect(food_group).not_to be_valid
    end

    it 'is not valid without a food_name' do
      food_group.food_name = nil
      expect(food_group).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:food) }
  end
end
