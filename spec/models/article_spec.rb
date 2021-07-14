require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:nutritionist) { Nutritionist.create(email: 'nut@email.com', username: 'nut', license_num: 12_345, years_exp: 5, password: 'qwerty', password_confirmation: 'qwerty') }
  let(:article) { nutritionist.articles.build(caption: 'Some Article Here') }

  describe 'Validations' do
    it 'is not valid without caption' do
      article.caption = nil
      expect(article).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:nutritionist) }
    it { is_expected.to have_many(:comments) }
  end
end
