require 'rails_helper'

RSpec.describe Stock, type: :model, vcr: true do
  it { expect(described_class.new).to validate_presence_of :name }
  it { expect(described_class.new).to validate_presence_of :ticker }

  describe 'new_search' do
    context 'when IEX Gem search is valid' do
      it 'creates the stock object' do
        expect(described_class.new_search('GOOG')).to be_an_instance_of described_class
      end
    end

    context 'when IEX Gem search is invalid' do
      it 'returns nil' do
        expect(described_class.new_search('adsadfasdf')).to be_nil
      end
    end
  end
end
