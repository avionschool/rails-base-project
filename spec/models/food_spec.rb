require 'rails_helper'

RSpec.describe Food, type: :model do
  subject {
    described_class.new(name: "Pizza")
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a food name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:food_group) }
    it { should have_many(:nutritional_informations) }
    it { should have_many(:comments) }
  end
  
end
