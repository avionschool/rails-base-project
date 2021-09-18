require 'rails_helper'

describe 'StockSample', type: request do
  it 'returns all stock symboels' do
    get 'https://sandbox.iexapis.com/v1'

    expect(response).to have_http_status(:success)
  end
end
