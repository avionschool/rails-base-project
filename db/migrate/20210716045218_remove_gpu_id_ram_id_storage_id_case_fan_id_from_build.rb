class RemoveGpuIdRamIdStorageIdCaseFanIdFromBuild < ActiveRecord::Migration[6.0]
  def change
    remove_column :builds, :gpu_id
    remove_column :builds, :storage_id
    remove_column :builds, :case_fan_id
    remove_column :builds, :ram_id
  end
end
