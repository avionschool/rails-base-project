class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :nutritionist_id
      t.string :caption
      t.timestamps 
    end
  end
end
