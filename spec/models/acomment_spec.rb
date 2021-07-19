require 'rails_helper'

RSpec.describe Acomment, type: :model do
  let(:acomment) { described_class.create(body: 'This is delicious') }

  describe 'Validations' do
    it 'is not valid without a comment' do
      acomment.body = nil
      expect(acomment).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:article) }
  end
end
