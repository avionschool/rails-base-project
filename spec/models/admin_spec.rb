require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'is not valid without email' do
    user_a = described_class.new(email: nil)
    expect(user_a).not_to be_valid
  end

  it 'is not valid without password' do
    user_a = described_class.new(encrypted_password: nil)
    expect(user_a).not_to be_valid
  end
end
