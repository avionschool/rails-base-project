require 'rails_helper'

RSpec.describe Broker, type: :model do
  broker_acct = described_class.new(email: 'sample@mail.com', username: 'sample')

  it 'is not valid without an email' do
    broker_acct.email = nil
    expect(broker_acct).not_to be_valid
  end

  it 'is not valid without a username' do
    broker_acct.username = nil
    expect(broker_acct).not_to be_valid
  end

  it 'is not valid for duplicate email' do
    broker2 = described_class.new(email: 'sample@mail.com', username: 'sample2')
    expect(broker2).not_to be_valid
  end

  it 'is not valid for duplicate username' do
    broker2 = described_class.new(email: 'sample2@mail.com', username: 'sample')
    expect(broker2).not_to be_valid
  end
end
