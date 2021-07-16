class CreateBuildRams < ActiveRecord::Migration[6.0]
  def change
    create_table :build_rams do |t|
      t.references :build, null: false, foreign_key: true
      t.references :ram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
