class AddUsersForeignKeyToMyStocks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :my_stocks, :users
  end
end
