class ReservationMailer <
  default from: 'notifications@yourapp.com'

  def reservation_approved(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject: 'Votre réservation a été approuvée !')
  end

  def reservation_rejected(reservation)
    @reservation = reservation
    mail(to: @reservation.user.email, subject: 'Votre réservation a été refusée.')
  end
end
