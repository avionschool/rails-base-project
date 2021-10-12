class CreateRcTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :rc_teachers do |t|
      t.integer :user_id
      t.integer :review_center_id
      t.string :status

      t.timestamps
    end
  end
end
