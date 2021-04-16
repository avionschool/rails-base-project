class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :current_Price
      t.integer :change
      t.integer :previous_close

      t.timestamps
    end
  end
end

