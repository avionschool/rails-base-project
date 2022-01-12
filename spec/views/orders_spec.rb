require 'rails_helper'

RSpec.describe "Orders", type: :feature do

  def seed_users
    User.create([
      {email: 'cc@avion.com', password: 'kristocurrency', admin: true},
      {email: 'new1@avion.com', password: 'qwerty', admin: false}
    ])
  end

  def seed_coins
    Coin.create([
      {
        base: 'BTC',
        target: 'USDT',
        last_price: 42563.2,
        volume: 3.2,
        coingecko_id: 'bitcoin',
        usd_24_h: 9.2
      },
      {
        base: 'ETH',
        target: 'USDT',
        last_price: 3265.1,
        volume: 9.89,
        coingecko_id: 'ethereum',
        usd_24_h: 1.26
      }
    ])
  end

  def admin_log_in
    visit root_path
    click_link('Sign in')
    fill_in "user[email]", with: "cc@avion.com"
    fill_in "user[password]", with: "kristocurrency"

    click_button('Log in')
  end

  describe "on visit" do
    before {seed_users}
    before {seed_coins}
    before {admin_log_in}
    before {visit trade_path("BTC")}

    it "shows coins index" do
      expect(find('div.trades-index-container')).to be_truthy
    end

  end
end