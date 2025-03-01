class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date_de_debut
      t.date :date_de_fin
      t.date :prix_total
      t.string :statut
      t.references :experiences, null: false, foreign_key: true

      t.timestamps
    end
  end
end
