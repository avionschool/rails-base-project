require 'rails_helper'

RSpec.describe FoodGroup, type: :model do
  subject {
    described_class.new(name: "bread",
                        food_name: "Pizza")
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a food_name" do
      subject.food_name = nil
      expect(subject).to_not be_valid
    end

  end

  describe "Associations" do
    it { should have_many(:food) }
  end
end
