require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { described_class.create(comment: 'This is delicious') }

  describe 'Validations' do
    it 'is not valid without a comment' do
      comment.comment = nil
      expect(comment).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:food) }
    it { is_expected.to belong_to(:article) }
  end
end
