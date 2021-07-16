class CreateBuildStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :build_storages do |t|
      t.references :build, null: false, foreign_key: true
      t.references :storage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
