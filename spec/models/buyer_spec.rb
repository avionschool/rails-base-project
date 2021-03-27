require 'rails_helper'

RSpec.describe Buyer, type: :model do
  context "validation tests" do

    let(:buyer) {build(:buyer)}

    it '1. ensures first name presence' do
      buyer.first_name = nil

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
    end

    it '2. ensures last name presence' do
      buyer.last_name = nil

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
   end

    it '3. ensures contact number presence' do
      buyer.contact_number = nil

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
  end

    it '4. ensures contact number does not include a letter' do
      buyer.contact_number = '92931231ASA2'

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
    end

    it '5. ensures contact number field is a minimum of 10' do
      buyer.contact_number = '123'

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
    end
  end
end
