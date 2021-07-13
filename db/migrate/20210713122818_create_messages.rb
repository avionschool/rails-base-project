class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
        t.integer :conversation_id
        t.string :user_id
        t.text :content
        t.boolean :read
      t.timestamps
    end
  end
end
