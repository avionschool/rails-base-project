require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    before do
      described_class.create(volume: 100, price: 0.11e3, fulfilled: false, transaction_type: 'Sell')
    end

    it { expect(described_class.new).to validate_inclusion_of(:transaction_type).in_array(%w[Buy Sell]) }
    it { expect(described_class.new).to validate_numericality_of(:volume).is_greater_than_or_equal_to(0) }
    it { expect(described_class.new).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

    it { is_expected.to allow_value(0).for(:volume) }
    it { is_expected.to allow_value(1).for(:volume) }
    it { is_expected.not_to allow_value(-1).for(:volume) }
    it { is_expected.not_to allow_value(-3).for(:volume) }
    it { is_expected.to allow_value(0).for(:price) }
    it { is_expected.to allow_value(1).for(:price) }
    it { is_expected.not_to allow_value(-1).for(:price) }
    it { is_expected.not_to allow_value(-3).for(:price) }
  end
end
