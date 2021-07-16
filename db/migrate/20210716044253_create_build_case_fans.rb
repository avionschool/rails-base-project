class CreateBuildCaseFans < ActiveRecord::Migration[6.0]
  def change
    create_table :build_case_fans do |t|
      t.references :build, null: false, foreign_key: true
      t.references :case_fan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
