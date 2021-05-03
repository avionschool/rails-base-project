require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    before do
      described_class.create(name: 'Buyer')
      described_class.create(name: 'Broker')
      described_class.create(name: 'Admin')
    end

    it { expect(described_class.new).to validate_inclusion_of(:name).in_array(%w[Buyer Broker Admin]) }
  end
end
