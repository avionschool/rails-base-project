class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  end
end
