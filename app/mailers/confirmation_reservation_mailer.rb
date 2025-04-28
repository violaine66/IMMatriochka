class ConfirmationReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_reservation_mailer.creation_confirmation.subject
  #
  def creation_confirmation
    @reservation = params[:reservation]
    @user = params[:user]
    @experience = @reservation.experience


    mail to: @reservation.user.email,
         subject: "reservation #{@reservation.experience.nom} confirmation"

  end
end
