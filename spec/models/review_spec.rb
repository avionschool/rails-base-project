require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { described_class.new }

  describe 'Review validations' do
    it 'Does not save if title is not present' do
      review.rating = 5
      review.body = 'Great test!'

      expect(review).not_to be_valid
    end

    it 'Does not save if rating is not present' do
      review.title = 'Testing'
      review.body = 'Great test!'

      expect(review).not_to be_valid
    end

    it 'Does not save if body is not present' do
      review.title = 'Testing'
      review.rating = 5

      expect(review).not_to be_valid
    end

    it 'Does not save if rating is < 5' do
      review.title = 'Testing'
      review.rating = 6
      review.body = 'Great test!'

      expect(review).not_to be_valid
    end

    it 'Does not save if rating is >= 0' do
      review.title = 'Testing'
      review.rating = 0
      review.body = 'Great test!'

      expect(review).not_to be_valid
    end
  end
end
