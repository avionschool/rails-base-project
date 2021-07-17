class CreateBuildGpus < ActiveRecord::Migration[6.0]
  def change
    create_table :build_gpus do |t|
      t.references :build, null: false, foreign_key: true
      t.references :gpu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
