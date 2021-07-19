require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { described_class.create(body: 'This is delicious') }

  describe 'Validations' do
    it 'is not valid without a comment' do
      comment.body = nil
      expect(comment).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:food) }
  end
end
