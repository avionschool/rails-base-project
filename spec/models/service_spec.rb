require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_presence_of(:type) }
    it { should validate_length_of(:type).is_at_most(50) }
  end
end
