class CreateRcCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :rc_courses do |t|
      t.integer :review_center_id
      t.integer :course_id

      t.timestamps
    end
  end
end
