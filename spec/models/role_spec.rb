require 'rails_helper'

RSpec.describe Role, type: :model do
  # Validations

  it { expect(described_class.new).to validate_presence_of :role_name }
end
