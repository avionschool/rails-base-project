require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_length_of(:category).is_at_most(50) }
  end

  describe 'database associations' do
    it { is_expected.to belong_to(:supplier) }
    it { is_expected.to have_many(:buyers).through(:buyer_services) }
    it { is_expected.to have_many(:reviews) }
  end
end
