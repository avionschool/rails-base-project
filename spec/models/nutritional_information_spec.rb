require 'rails_helper'

RSpec.describe NutritionalInformation, type: :model do
  subject {
    described_class.new(label: "Cholesterol",
                        quantity: 22.4,
                        unit: "mg")
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a label" do
      subject.label = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a unit" do
      subject.unit = nil
      expect(subject).to_not be_valid
    end

  end

  describe "Associations" do
    it { should belong_to(:food) }
  end
end
