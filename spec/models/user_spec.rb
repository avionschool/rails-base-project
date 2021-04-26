require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  it { expect(described_class.new).to validate_presence_of :role_id }
  it { expect(described_class.new).to validate_presence_of :firstname }
  it { expect(described_class.new).to validate_presence_of :lastname }
  it { expect(described_class.new).to validate_presence_of :email }
  it { expect(described_class.new).to validate_presence_of :password }
end
