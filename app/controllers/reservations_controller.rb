class ReservationsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_reservation, only: [:approve, :reject]

  def index
    @reservations = current_user.reservations
    @reservations = Reservation.order(created_at: :desc)
  end

  def new
    @reservation = @experience.reservations.build
  end

  def create
    @reservation = @experience.reservations.build(reservation_params)
    @reservation.user = current_user
    @reservation.statut = 'en_attente' # Statut initial

    if @reservation.save
      redirect_to experiences_path, notice: 'Votre réservation a bien été enregistrée et attend la validation de l\'administrateur.'
    else
      render 'experiences/show', alert: 'Erreur lors de la création de la réservation.'
    end
  end

  # Action pour approuver la réservation
  def approve
    @reservation.update(statut: 'approuvé')
    redirect_to admin_reservations_path, notice: 'Réservation approuvée.'
  end

  def reject
    @reservation.update(statut: 'rejeté')
    redirect_to admin_reservations_path, notice: 'Réservation rejetée.'
  end


  private
  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def check_admin
    unless current_user.role == 'admin'
      redirect_to experiences_path, alert: 'Vous n\'avez pas l\'autorisation d\'effectuer cette action.'
    end
  end

  def reservation_params
    params.require(:reservation).permit(:date_de_debut, :date_de_fin, :prix_total, :statut, :experience_id)
  end
end
