require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject {
    described_class.new(comment: "This is delicious")
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a comment" do
      subject.comment = nil
      expect(subject).to_not be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:food) }
    it { should belong_to(:article) }
  end
end
