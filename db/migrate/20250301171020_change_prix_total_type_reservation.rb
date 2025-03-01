class ChangePrixTotalTypeReservation < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :prix_total, :string  # Étape 1 : Convertir en string
    change_column :reservations, :prix_total, :integer, using: 'prix_total::integer' 
  end
end
