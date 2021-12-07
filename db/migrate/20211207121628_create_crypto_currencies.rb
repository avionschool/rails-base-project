class CreateCryptoCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :crypto_currencies do |t|
      t.string :code, :limit => 3
      t.string :name
      t.decimal :rate
      t.boolean :is_active, default: false
      t.timestamps
    end
  end
end
