class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets, id: :uuid do |t|
      t.string :logo
      t.string :name
      t.string :symbol
      t.text :description
      t.float :buying_price
      t.float :selling_price

      t.timestamps
    end
  end
end
