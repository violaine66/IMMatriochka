class ReservationMailer <
  default from: 'notifications@yourapp.com'

  def statut_updated(reservation)
    @reservation = reservation
    @user = reservation.user
    @statut = reservation.statut

    mail(to: @user.email, subject: "Mise à jour du statut de votre réservation")
  end
end
