class Reservation < ApplicationRecord
  belongs_to :experience
  belongs_to :user

  after_create :notify_admin

  validates :date_de_debut, presence: true
  validates :date_de_fin, presence: true
  validate :date_de_fin_must_be_after_date_de_debut

  validate :no_overlap_with_existing_reservations

  validate :valid_admin_confirmation, on: :create

  private

  def date_de_fin_must_be_after_date_de_debut
    if date_de_fin.present? && date_de_debut.present? && date_de_fin <= date_de_debut
      errors.add(:date_de_fin, "doit être au moins un jour après la date de début")
    end
  end

  def no_overlap_with_existing_reservations
    conflicting_reservations = exeperience.reservations.where('date_de_debut < ? AND date_de_fin > ?', date_de_fin, date_de_debut).exists?
    errors.add(:base, "Les dates choisies sont déjà réservées") if conflicting_reservations
  end

  def notify_admin
    AdminMailer.new_reservation(self).deliver_now
  end

  def valid_admin_confirmation
    unless status == 'confirmed'
      errors.add(:base, "La réservation doit être confirmée par un administrateur avant d'être validée.")
    end
  end
end
