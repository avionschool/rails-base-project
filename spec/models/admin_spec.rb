require 'rails_helper'

RSpec.describe Admin, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  administrator = described_class.new(email: 'sample@mail.com', username: 'sample')

  it 'is not valid without an email' do
    administrator.email = nil
    expect(administrator).not_to be_valid
  end

  it 'is not valid without a username' do
    administrator.username = nil
    expect(administrator).not_to be_valid
  end

  it 'is not valid for duplicate email' do
    admin2 = described_class.new(email: 'sample@mail.com', username: 'sample2')
    expect(admin2).not_to be_valid
  end

  it 'is not valid for duplicate username' do
    admin2 = described_class.new(email: 'sample2@mail.com', username: 'sample')
    expect(admin2).not_to be_valid
  end
end
