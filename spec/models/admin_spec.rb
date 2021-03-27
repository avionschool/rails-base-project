require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "validation tests" do

    let(:admin) {build(:admin)}

    it '1. ensures first name presence' do
      admin.first_name = nil

      expect(admin).to_not be_valid
      expect(admin.errors).to be_present
      expect(admin).to_not be_valid
    end

    it '2. ensures last name presence' do
      admin.last_name = nil

      expect(admin).to_not be_valid
      expect(admin.errors).to be_present
      expect(admin).to_not be_valid
   end
  end
end
