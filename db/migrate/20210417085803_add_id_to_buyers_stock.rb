class AddIdToBuyersStock < ActiveRecord::Migration[6.1]
  def change
    add_column :buyers_stocks, :id, :primary_key
  end
end
