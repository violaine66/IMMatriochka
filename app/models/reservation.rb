class Reservation < ApplicationRecord
  belongs_to :experience

  validates :date_de_debut, presence: true
  validates :date_de_fin, presence: true
  validates :date_de_fin, comparison: { greater_than: :date_de_debut,
                                      message: 'doit être au moins un jour après la date de départ !' }


end
