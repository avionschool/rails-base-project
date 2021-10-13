class CreateTeacherSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_subjects do |t|
      t.integer :rc_teacher_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
