class ChangeCaseTypeToCaseFormFactor < ActiveRecord::Migration[6.0]
  def change
    rename_column :cases, :type, :form_factor
  end
end
