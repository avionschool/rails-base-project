require 'rails_helper'

RSpec.describe Wallet, type: :model do
  context 'when validating associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:running_balance) }
  end

  context 'when validating values for numerals' do
    it { is_expected.to validate_numericality_of(:running_balance).is_greater_than_or_equal_to(0) }
  end
end
