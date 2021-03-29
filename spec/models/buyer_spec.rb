require 'rails_helper'

RSpec.describe Buyer, type: :model do
  context 'with validation tests' do
    let(:buyer) { build(:buyer) }

    it '1. ensures first name presence' do
      buyer.first_name = nil
      expect(buyer).not_to be_valid
    end

    it '2. ensures last name presence' do
      buyer.last_name = nil
      expect(buyer).not_to be_valid
    end

    it '3. ensures contact number presence' do
      buyer.contact_number = nil
      expect(buyer).not_to be_valid
    end

    it '4. ensures contact number does not include a letter' do
      buyer.contact_number = '92931231ASA2'
      expect(buyer).not_to be_valid
    end

    it '5. ensures contact number field is a minimum of 10' do
      buyer.contact_number = '123'
      expect(buyer).not_to be_valid
    end
  end
  
  describe 'database associations' do
    it { is_expected.to have_many(:services).through(:buyer_services) }
    it { is_expected.to have_many(:reviews) }
  end
end
