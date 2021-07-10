require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new(caption: "Some Article Here")
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without caption" do
      subject.caption = nil
      expect(subject).to_not be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:nutritionist) }
    it { should have_many(:comments) }
  end
end
