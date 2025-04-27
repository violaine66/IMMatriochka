# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin # Vérification que l'utilisateur est un admin

  # Affichage du tableau de bord pour l'admin
  def dashboard
    # Récupère toutes les réservations en attente
    @reservations = Reservation.where(statut: 'en_attente')
  end

  # Vérifie que l'utilisateur connecté est bien un administrateur
  private
  def authenticate_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Accès interdit. Vous n'êtes pas administrateur."
    end
  end
end
