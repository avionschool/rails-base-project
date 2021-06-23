require 'rails_helper'

RSpec.describe Buyer, type: :model do
  buyer_acct = described_class.new(email: 'sample@mail.com', username: 'sample')

  it 'is not valid without an email' do
    buyer_acct.email = nil
    expect(buyer_acct).not_to be_valid
  end

  it 'is not valid without a username' do
    buyer_acct.username = nil
    expect(buyer_acct).not_to be_valid
  end

  it 'is not valid for duplicate email' do
    buyer2 = described_class.new(email: 'sample@mail.com', username: 'sample2')
    expect(buyer2).not_to be_valid
  end

  it 'is not valid for duplicate username' do
    buyer2 = described_class.new(email: 'sample2@mail.com', username: 'sample')
    expect(buyer2).not_to be_valid
  end
end
