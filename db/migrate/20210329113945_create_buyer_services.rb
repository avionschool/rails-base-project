class CreateBuyerServices < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_services do |t|
      t.references :supplier, foreign_key: true
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end
