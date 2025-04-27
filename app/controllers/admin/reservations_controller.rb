# class Admin::ReservationsController < ApplicationController
#   # app/controllers/admin/reservations_controller.rb
# class Admin::ReservationsController < ApplicationController
#   before_action :set_reservation, only: [:show, :approve, :reject]

#   # Affiche la liste de toutes les réservations
#   def index
#     @reservations = Reservation.all
#   end

#   # Affiche les détails d'une réservation spécifique
#   def show
#   end

#   # Approuver une réservation
#   def approve
#     if @reservation.update(status: 'approved')
#       redirect_to admin_reservations_path, notice: 'Réservation approuvée.'
#     else
#       redirect_to admin_reservations_path, alert: 'Erreur lors de l\'approbation de la réservation.'
#     end
#   end

#   # Rejeter une réservation
#   def reject
#     if @reservation.update(status: 'rejected')
#       redirect_to admin_reservations_path, notice: 'Réservation rejetée.'
#     else
#       redirect_to admin_reservations_path, alert: 'Erreur lors du rejet de la réservation.'
#     end
#   end

#   private

#   # Trouver la réservation avec l'ID passé en paramètre
#   def set_reservation
#     @reservation = Reservation.find(params[:id])
#   end
# end

# end
