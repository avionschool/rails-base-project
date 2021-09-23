require 'rails_helper'

RSpec.describe UserStock, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:stock_code) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  context 'when validating values for numerals' do
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end
end
