require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'is not valid without a role name' do
    role = described_class.new(role: nil)
    expect(role).not_to be_valid
  end

  it 'is not valid if role is empty string' do
    role = described_class.new(role: '')
    expect(role).not_to be_valid
  end
end
