class ReservationStatusMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_status_mailer.status_updated.subject
  #
  def status_updated(reservation)


    @reservation = reservation
    @user = reservation.user


    mail(
      to: @user.email,
      subject: "Mise à jour de votre réservation ##{reservation.id}"
    )
  end
end
