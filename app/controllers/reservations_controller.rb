class ReservationsController < ApplicationController
  before_action :set_experience, only: [:new, :create]

  def index
    @reservations = current_user.reservations
  end


  def new
    @reservation = @experience.reservations.build


  end

  def create
    @reservation = @experience.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save

      redirect_to experiences_path, notice: 'Votre réservation a bien été enregistrée'
    else
      redirect_to experiences_path, statut: :unprocessable_entity
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
