require 'rails_helper'

RSpec.describe RcCourse, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:review_center_id) }
    it { is_expected.to validate_presence_of(:course_id) }
  end

  context 'when validating associations' do
    it { is_expected.to belong_to(:review_center) }
    it { is_expected.to belong_to(:course) }
    it { is_expected.to have_many(:lessons) }
  end
end
