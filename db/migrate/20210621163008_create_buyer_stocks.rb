class CreateBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_stocks do |t|
      t.references :buyer
      t.string :symbol
      t.integer :price
      t.string :company_name
      t.timestamps
    end
  end
end
