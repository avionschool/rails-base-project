require 'rails_helper'

RSpec.describe UserStock, type: :model do
  let(:user_stock) { described_class.new }

  it 'belongs to a user' do
    expect(user_stock).to belong_to(:user)
  end

  context 'with validations' do
    it 'is not valid without ticker' do
      expect(user_stock).to validate_presence_of(:ticker)
    end

    it 'is not valid without company name' do
      expect(user_stock).to validate_presence_of(:company_name)
    end

    it 'is not valid without price' do
      expect(user_stock).to validate_presence_of(:price)
    end
  end
end
