# app/mailers/previews/reservation_status_mailer_preview.rb

class ReservationStatusMailerPreview < ActionMailer::Preview
  def status_updated
    # Crée une réservation de test et un utilisateur pour la prévisualisation
    user = User.first || User.create!(email: 'test@example.com', password: 'password')
    reservation = Reservation.first || Reservation.create!(user: user, statut: 'en_attente')

    # Passe ces objets à la méthode status_updated du mailer
    ReservationStatusMailer.with(reservation: reservation, user: user).status_updated
  end
end
