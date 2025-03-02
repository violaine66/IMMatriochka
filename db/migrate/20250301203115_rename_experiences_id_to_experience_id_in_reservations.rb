class RenameExperiencesIdToExperienceIdInReservations < ActiveRecord::Migration[7.1]
  def change
    rename_column :reservations, :experiences_id, :experience_id
  end
end
