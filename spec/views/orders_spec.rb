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

  def fill_order(type, quantity)
    fill_in "#{type}_order_quantity", with: "#{quantity}"
    click_button("#{type.capitalize}")
  end

  describe "on visit" do
    before {seed_users}
    before {seed_coins}
    before {admin_log_in}
    before {visit trade_path("BTC")}

    it "shows coins index" do
      expect(find('div.trades-index-container')).to be_truthy
    end
    
    it "shows initial money" do
      expect(page).to have_content("5000")
    end
  end
  

  describe "On creation of order" do
    before {seed_users}
    before {seed_coins}
    before {admin_log_in}
    before {visit trade_path("BTC")}


    it "shows a buy order created" do 
      fill_order("buy", 0.01)
      expect(page).to have_selector('.order-item-container', count: 2)
    end

    it "shows a sell order created" do
      fill_order("buy", 0.01)
      fill_order("sell", 0.01)
      expect(page).to have_selector('.order-item-container', count: 3)
    end

    it "shows error message" do
      fill_order("buy", 1)
      expect(page).to have_content("insufficient balance")
    end
  end
end
