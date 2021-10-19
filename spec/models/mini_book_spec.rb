require 'rails_helper'

RSpec.describe MiniBook, type: :model do
  context 'when user is creating a minibook' do
    it 'is not allowed without a name' do
      minibook = described_class.new(user_id: nil, minibook_name: nil, minibook_price: 100)
      expect(minibook).not_to be_valid
    end
  end
end
