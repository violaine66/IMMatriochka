module Admin
  class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_if_admin

    def index
      @reservations = Reservation.includes(:experience, :user).order(created_at: :desc)
    end

    def approve
      if @reservation.update(status: "confirmée")
        redirect_to admin_reservations_path, notice: "Réservation approuvée."
      else
        redirect_to admin_reservations_path, alert: "Erreur lors de l'approbation de la réservation."
      end
    end

      def reject
    if @reservation.update(status: "rejetée")
      redirect_to admin_reservations_path, notice: "Réservation rejetée."
    else
      redirect_to admin_reservations_path, alert: "Erreur lors du rejet de la réservation."
    end
  end

    private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_reservations_path, alert: "Réservation introuvable."
    end


    def check_if_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Accès refusé. Vous devez être administrateur pour accéder à cette page."
      end
    end
  end
end
