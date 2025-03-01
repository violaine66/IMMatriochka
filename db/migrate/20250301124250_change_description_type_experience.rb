class ChangeDescriptionTypeExperience < ActiveRecord::Migration[7.1]
  def change
    change_column :experiences, :description, :text
  end
end
