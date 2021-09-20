class DropTableSampleStocks < ActiveRecord::Migration[6.0]
 def change
    drop_table :sample_stocks
  end
end
