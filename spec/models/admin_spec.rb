require 'rails_helper'
RSpec.describe Admin, type: :model do
  context 'with validation tests' do

    let(:admin) { build(:admin) }

    it '1. ensures first name presence' do
      admin.first_name = nil
      expect(admin).not_to be_valid
    end

    it '2. ensures last name presence' do
    admin.last_name = nil
      expect(admin).not_to be_valid
    end
  end
end
