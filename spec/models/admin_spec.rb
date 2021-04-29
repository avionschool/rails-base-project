require 'rails_helper'

RSpec.describe Admin, type: :model do
  # Validations

  it { expect(described_class.new).to validate_presence_of :email }
  it { expect(described_class.new).to validate_presence_of :password }
end
