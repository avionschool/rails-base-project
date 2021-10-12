require 'rails_helper'

RSpec.describe TeacherSubject, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:rc_teacher_id) }
    it { is_expected.to validate_presence_of(:subject_id) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:rc_teacher) }
    it { is_expected.to belong_to(:subject) }
  end
end
