require 'rails_helper'

RSpec.describe NutritionalInformation, type: :model do
  let!(:user) { User.create(email: 'user@email.com', username: 'new_user', password: 'qwerty', password_confirmation: 'qwerty', confirmed_at: Time.zone.now, confirmation_sent_at: Time.zone.now, confirmation_token: 'token') }
  let!(:food) { user.foods.build(name: 'Pizza') }
  let(:nutritional_information) { food.nutritional_informations.build(label: 'Calories', quantity: 100, unit: 'cal') }

  describe 'Validations' do
    it 'is not valid without a label' do
      nutritional_information.label = nil
      expect(nutritional_information).not_to be_valid
    end

    it 'is not valid without a quantity' do
      nutritional_information.quantity = nil
      expect(nutritional_information).not_to be_valid
    end

    it 'is not valid without a unit' do
      nutritional_information.unit = nil
      expect(nutritional_information).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:food) }
  end
end
