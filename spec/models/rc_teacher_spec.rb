require 'rails_helper'

RSpec.describe RcTeacher, type: :model do
  context 'when validating associations' do
    # it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:review_center) }
    it { is_expected.to have_many(:teacher_subjects) }
  end
end
