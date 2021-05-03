require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'validations' do
    before do
      described_class.create(code: 'ZYXI', name: 'Zynex Inc', volume: 0)
    end

    it { expect(described_class.new).to validate_numericality_of(:volume).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_uniqueness_of(:code) }

    it { is_expected.to allow_value(0).for(:volume) }
    it { is_expected.to allow_value(1).for(:volume) }
    it { is_expected.not_to allow_value(-1).for(:volume) }
    it { is_expected.not_to allow_value(-3).for(:volume) }
  end

  describe 'stock exists? method' do
    before do
      described_class.create(code: 'AAPL', name: 'Apple Inc', volume: 0)
    end

    it 'returns true if stock code exists' do
      expect(described_class.exists?('AAPL')).to be true
    end

    it "returns false if stock code doesn't exist" do
      expect(described_class.exists?('ZYXI')).to be false
    end
  end
end
