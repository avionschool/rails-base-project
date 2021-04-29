require 'rails_helper'

RSpec.describe BrokerStock, type: :model do
  # Validations
  it { expect(described_class.new).to validate_presence_of :user_id }
  it { expect(described_class.new).to validate_presence_of :ticker }
  it { expect(described_class.new).to validate_presence_of :company }
  it { expect(described_class.new).to validate_presence_of :price }
end
