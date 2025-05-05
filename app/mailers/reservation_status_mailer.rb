class ReservationStatusMailer < ApplicationMailer
  def status_updated
    # Assure-toi d'utiliser @reservation et @user, qui sont passés via la méthode with
    @reservation = params[:reservation]
    @user = params[:user]

    # Envoi du mail
    mail(
      to: @user.email,
      subject: "Mise à jour de votre réservation ##{@reservation.id}"
    )
  end
end

