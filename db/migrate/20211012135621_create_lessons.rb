class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :details
      t.integer :teacher_subject_id
      t.integer :rc_course_id
      t.float :price
      t.string :status

      t.timestamps
    end
  end
end
