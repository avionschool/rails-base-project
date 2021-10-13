require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'when validating admin' do
    it 'is not valid without username' do
      admin1 = described_class.new
      admin1.username = nil

      expect(admin1).not_to be_valid
    end

    it 'is not valid if username is less than 6 characters' do
      admin2 = described_class.new
      admin2.username = 'piggy'

      expect(admin2).not_to be_valid
    end
  end
end
