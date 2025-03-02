class Reservation < ApplicationRecord
  belongs_to :experience

  validates :date_de_debut, presence: true
  validates :date_de_fin, presence: true
  validate :date_de_fin_must_be_after_date_de_debut

  private

  def date_de_fin_must_be_after_date_de_debut
    if date_de_fin.present? && date_de_debut.present? && date_de_fin <= date_de_debut
      errors.add(:date_de_fin, "doit être au moins un jour après la date de début")
    end
  end
end
