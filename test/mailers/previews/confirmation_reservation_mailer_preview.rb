# Preview all emails at http://localhost:3000/rails/mailers/confirmation_reservation_mailer
class ConfirmationReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirmation_reservation_mailer/creation_confirmation
# test/mailers/previews/confirmation_reservation_mailer_preview.rb

  def creation_confirmation
    # Assurez-vous que la réservation et l'utilisateur existent
    reservation = Reservation.last

    # Si Reservation.first renvoie nil, tu pourrais ajouter une vérification comme ceci :
    if reservation.nil?
      # Crée une réservation factice pour la prévisualisation (à ajuster selon ton modèle)
      reservation = Reservation.create(
        user: User.first, # Assure-toi qu'il y a un utilisateur dans ta base de données
        experience: Experience.first # Assure-toi qu'il y a une expérience
      )
    end

    # Passe les paramètres au mailer
    user = reservation.user
    ConfirmationReservationMailer.with(reservation: reservation, user: user).creation_confirmation
  end
end
