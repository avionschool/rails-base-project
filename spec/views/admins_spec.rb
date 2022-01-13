require 'rails_helper'

RSpec.describe "Admin controls", type: :feature do

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

  def user_log_in
    visit root_path
    click_link('Sign in')
    fill_in "user[email]", with: "new1@avion.com"
    fill_in "user[password]", with: "qwerty"

    click_button('Log in')
  end

  def admin_log_in
    visit root_path
    click_link('Sign in')
    fill_in "user[email]", with: "cc@avion.com"
    fill_in "user[password]", with: "kristocurrency"

    click_button('Log in')
  end

  def fill_coins(base: ,coingecko_id: )
    fill_in "coin[base]", with: base
    fill_in "coin[coingecko_id]", with: coingecko_id
  end

  before {seed_users}
  before {seed_coins}

  describe "on regular user visit" do
    before {user_log_in}

    it "returns forbidden" do
      visit admins_path

      expect(page).to have_http_status(403)
    end
  end

  describe "on admin visit" do
    before {admin_log_in}
    before {visit admins_path}

    it "shows coins index" do
      click_link('Coins')
      expect(page).to have_content('Add new coin')
      expect(page).to have_content('BTC')
    end

    it "shows users index" do
      click_link("Users")
      expect(page).to have_content('Add new user')
      expect(page).to have_content('cc@avion.com')
    end

  end

  describe "on admin ADD coins" do
    before {admin_log_in}
    before {visit admins_path}
    before {click_link('Coins')}
    before {click_link('Add new coin')}

    it "fails to add on blank params" do
      fill_coins(base: "", coingecko_id: "")
      click_button('Create Coin')
      expect(page).to have_content("prohibited this coin from being saved")
    end

    it "fails to add on non-binance coins" do
      fill_coins(base: "POOCOIN", coingecko_id: "poocoin")
      click_button('Create Coin')
      expect(page).to have_content("may not be listed on binance")
    end

    it "adds a proper coin" do
      fill_coins(base: "MANA", coingecko_id: "decentraland")
      click_button('Create Coin')
      expect(page).to have_content("successfully added")
    end
  end
end