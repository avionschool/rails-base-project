require 'rails_helper'

RSpec.describe BrokerStock, type: :model do
  let!(:broker) { Broker.create(email: 'e@email.com', password: 'password', password_confirmation: 'password') }
  let(:broker_stock) { broker.broker_stocks.build(symbol: 'MC', price: 260.76, company_name: 'Microsoft Corp') }

  context 'with validations/stock should fail to save' do
    it 'is not valid without symbol' do
      broker_stock.symbol = 'MC'

      expect(broker_stock).to be_valid
    end

    it 'is not valid without a company_name' do
      broker_stock.company_name = nil

      expect(broker_stock).not_to be_valid
    end
  end
end
