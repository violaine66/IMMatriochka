class Experience < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
end
