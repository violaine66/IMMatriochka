# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  # Affiche le tableau de bord de l'admin
  def dashboard
    @reservations = Reservation.all
  end

  # Approuve une réservation
  def approve
    @reservation = Reservation.find(params[:id])
    if @reservation.update(statut: 'Approuvé')
      redirect_to admin_dashboard_path, notice: 'Réservation approuvée avec succès.'
    else
      redirect_to admin_dashboard_path, alert: 'Erreur lors de l\'approbation de la réservation.'
    end
  end

  # Rejette une réservation
  def reject
    @reservation = Reservation.find(params[:id])
    if @reservation.update(statut: 'Rejetée')
      redirect_to admin_dashboard_path, notice: 'Réservation rejetée avec succès.'
    else
      redirect_to admin_dashboard_path, alert: 'Erreur lors du rejet de la réservation.'
    end
  end

  private

  def authenticate_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Accès interdit. Vous n'êtes pas administrateur."
    end
  end
end
