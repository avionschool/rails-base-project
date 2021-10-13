require 'rails_helper'

RSpec.describe Lesson, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:rc_course) }
    it { is_expected.to belong_to(:teacher_subject) }
  end
end
