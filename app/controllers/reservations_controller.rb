class ReservationsController < ApplicationController
  before_action :set_experience, only: [:new, :create]

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
    @reservation.statut = 'En attente'

    if @reservation.save

      redirect_to experiences_path, notice: 'Votre réservation a bien été enregistrée'
    else
      redirect_to experiences_path, statut: :unprocessable_entity
    end
  end

  def approve
    @reservation = Reservation.find(params[:id])
    if @reservation.update(statut: 'Confirmée')
      ReservationMailer.reservation_approved(@reservation).deliver_now
      redirect_to admin_dashboard_path, notice: 'Réservation approuvée et utilisateur notifié.'
    else
      redirect_to admin_dashboard_path, alert: 'Erreur lors de l\'approbation.'
    end
  end

  def reject
    @reservation = Reservation.find(params[:id])
    if @reservation.update(statut: 'Rejetée')
      ReservationMailer.reservation_rejected(@reservation).deliver_now
      redirect_to admin_dashboard_path, notice: 'Réservation rejetée et utilisateur notifié.'
    else
      redirect_to admin_dashboard_path, alert: 'Erreur lors du rejet.'
    end
  end



  private
  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date_de_debut, :date_de_fin, :prix_total, :statut, :experience_id)
  end
end
