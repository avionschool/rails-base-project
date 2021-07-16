class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :nutritionist_username
      t.integer :nutritionist_id
      t.string :caption
      t.string :source_url
      t.timestamps 
    end
  end
end
