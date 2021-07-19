class RemovingUnnecessaryUser1IdColInTransacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :transacts, :user1_id
  end
end
