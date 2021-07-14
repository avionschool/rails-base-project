require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) { User.create(email: 'user@email.com', username: 'new_user', password: 'qwerty', password_confirmation: 'qwerty') }
  let(:food) { user.foods.build(name: 'Pizza', food_group: 'bread') }

  describe 'Validations' do
    it 'is not valid without a food name' do
      food.name = nil
      expect(food).not_to be_valid
    end

    it 'is not valid without a food group' do
      food.food_group = nil
      expect(food).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:nutritional_informations) }
    it { is_expected.to have_many(:comments) }
  end
end
