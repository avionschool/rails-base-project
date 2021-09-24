require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:stock) { described_class.new(ticker: 'AAPL') }

  it 'belongs to a user' do
    expect(stock).to belong_to(:user)
  end
end
