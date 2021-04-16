require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { expect(described_class.new).to validate_presence_of :email }
end