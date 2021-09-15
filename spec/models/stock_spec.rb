require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:current_price) }
  end

  context 'when validating values for numerals' do
    it { is_expected.to validate_numericality_of(:current_price).is_greater_than(0) }
  end
end
