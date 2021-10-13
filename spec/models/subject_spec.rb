require 'rails_helper'

RSpec.describe Subject, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to have_many(:teacher_subjects) }
  end
end
