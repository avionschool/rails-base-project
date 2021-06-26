class AddIndexToStock < ActiveRecord::Migration[6.0]
  def change
    add_index :stocks, :symbol, unique: true
  end
end
