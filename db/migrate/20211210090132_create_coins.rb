class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :base
      t.string :target
      t.decimal :last_price
      t.decimal :volume

      t.timestamps
    end
  end
end
