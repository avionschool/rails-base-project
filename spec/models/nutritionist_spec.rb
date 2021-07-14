require 'rails_helper'

RSpec.describe Nutritionist, type: :model do
  let(:nutritionist) { described_class.new(email: 'nut@email.com', username: 'nut', license_num: 12_345, years_exp: 5, password: 'qwerty', password_confirmation: 'qwerty') }

  describe 'Validations' do
    it 'is not valid without an email' do
      nutritionist.email = nil
      expect(nutritionist).not_to be_valid
    end

    it 'is not valid without a username' do
      nutritionist.username = nil
      expect(nutritionist).not_to be_valid
    end

    it 'is not valid without license_num' do
      nutritionist.license_num = nil
      expect(nutritionist).not_to be_valid
    end

    it 'is not valid without years_exp' do
      nutritionist.years_exp = nil
      expect(nutritionist).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:articles) }
  end
end
