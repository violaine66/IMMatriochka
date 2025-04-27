class Reservation < ApplicationRecord
  belongs_to :experience
  belongs_to :user

  after_create :set_initial_statut

  # Validations
  validates :date_de_debut, presence: true
  validates :date_de_fin, presence: true
  validate :date_de_fin_must_be_after_date_de_debut
  validate :no_overlap_with_existing_reservations
  validates :statut, inclusion: { in: ['en_attente', 'confirmée', 'rejetée'] }

  # Méthodes privées
  private

  # Validation pour vérifier que la date de fin est après la date de début
  def date_de_fin_must_be_after_date_de_debut
    if date_de_fin.present? && date_de_debut.present? && date_de_fin <= date_de_debut
      errors.add(:date_de_fin, "doit être au moins un jour après la date de début")
    end
  end

  # Validation pour vérifier les chevauchements avec des réservations existantes
  def no_overlap_with_existing_reservations
    conflicting_reservations = experience.reservations.where('date_de_debut < ? AND date_de_fin > ?', date_de_fin, date_de_debut).exists?
    errors.add(:base, "Les dates choisies sont déjà réservées") if conflicting_reservations
  end

   # Définir le statut initial comme "en_attente"
   def set_initial_statut
    self.statut ||= 'en_attente'
  end

  # Validation pour vérifier que la réservation doit être confirmée par un administrateur
  def valid_admin_confirmation
    # Vérifie que la réservation est en statut 'confirmed' avant de la valider
    if statut != 'Confirmée'  # Utilise 'statut' au lieu de 'status'
      errors.add(:base, "La réservation doit être confirmée par un administrateur avant d'être validée.")
    end
  end

end
