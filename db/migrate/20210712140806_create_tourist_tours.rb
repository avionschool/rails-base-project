class CreateTouristTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tourist_tours do |t|
      t.belongs_to :tourist
      t.belongs_to :tour
      t.integer :guest_quantity
      t.decimal :amount_bought
      t.date  :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
