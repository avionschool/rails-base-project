require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user1 = described_class.new(email: 'email@example.com', password: 'password')
    expect(user1).to be_valid
  end

  it 'is not valid without first_name' do
    user2 = described_class.new(first_name: nil)
    expect(user2).not_to be_valid
  end

  it 'is not valid without last_name' do
    user2 = described_class.new(last_name: nil)
    expect(user2).not_to be_valid
  end

  it 'is not valid without email' do
    user2 = described_class.new(email: nil)
    expect(user2).not_to be_valid
  end

  it 'is not valid without username' do
    user2 = described_class.new(username: nil)
    expect(user2).not_to be_valid
  end
end
