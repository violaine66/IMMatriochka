class ConfirmationReservationMailerPreview < ActionMailer::Preview
  def creation_confirmation
    # Ici, récupère une réservation existante ou crée une instance pour le test
    reservation = Reservation.first
    user = reservation.user
    ConfirmationReservationMailer.with(reservation: reservation, user: user).creation_confirmation
  end
end
