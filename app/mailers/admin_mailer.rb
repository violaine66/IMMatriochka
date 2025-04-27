class AdminMailer < ApplicationMailer
  default from: 'notifications@yourapp.com'

  def new_reservation(reservation)
    @reservation = reservation
    @admin = User.find_by(admin: true)
    mail(to: @admin.email, subject: 'Nouvelle demande de réservation en attente')
  end
end
