class CreateAcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :acomments do |t|
      t.integer :article_id
      t.string :commenter
      t.string :body
      t.timestamps
    end
  end
end
