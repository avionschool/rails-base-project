require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when validating associations' do
    it { is_expected.to have_many(:subjects) }
    it { is_expected.to have_many(:rc_courses) }
  end
end
