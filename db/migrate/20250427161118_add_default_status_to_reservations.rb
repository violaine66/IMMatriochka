class AddDefaultStatusToReservations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reservations, :statut, 'En attente'
  end
end
