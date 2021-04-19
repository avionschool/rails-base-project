class AddAllotedCashToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.decimal "alloted_cash", default: 0
    end
    change_table :buyers_stocks do |t|
      t.integer "alloted_volume", default: 0
    end
  end
end
