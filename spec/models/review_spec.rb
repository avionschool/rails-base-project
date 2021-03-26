require 'rails_helper'

RSpec.describe Review, type: :model do
  before(:each) do
    @review = Review.new
  end
  describe "Review validations" do
    it "Should not save if title is not present" do
      @review.rating = 5
      @review.body = "Great test!"

      expect(@review).to_not be_valid
    end
    it "Should not save if rating is not present" do
      @review.title = "Testing"
      @review.body = "Great test!"

      expect(@review).to_not be_valid
    end
    it "Should not save if body is not present" do
      @review.title = "Testing"
      @review.rating = 5

      expect(@review).to_not be_valid
    end
    it "Should not save if rating is < 5" do
      @review.title = "Testing"
      @review.rating = 6
      @review.body = "Great test!"

      expect(@review).to_not be_valid
    end
    it "Should not save if rating is >= 0" do
      @review.title = "Testing"
      @review.rating = 0
      @review.body = "Great test!"

      expect(@review).to_not be_valid
    end
  end
end
