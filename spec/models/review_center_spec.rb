require 'rails_helper'

RSpec.describe ReviewCenter, type: :model do
  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when validating maximum character length' do
    it { is_expected.to validate_length_of(:email).is_at_most(45) }
    it { is_expected.to validate_length_of(:name).is_at_most(75) }
  end

  context 'when validating uniqueness' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
