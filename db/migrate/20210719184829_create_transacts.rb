class CreateTransacts < ActiveRecord::Migration[6.0]
  def change
    create_table :transacts do |t|
      t.integer :item_id
      t.string :traded_with
      t.integer :user1_id   # user1 is the 'seller'; the one who posted the listing
      t.integer :user2_id   # user2 is the 'buyer'
      t.timestamps
    end
  end
end
