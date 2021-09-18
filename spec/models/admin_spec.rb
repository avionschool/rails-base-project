require 'rails_helper'

RSpec.describe Admin, type: :model do

  it 'is not valid without email' do
    userA = described_class.new(email: nil)
    expect(userA).not_to be_valid
  end

  it 'is not valid without password' do
    userA = described_class.new(encrypted_password: nil)
    expect(userA).not_to be_valid
  end

end
