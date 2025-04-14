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

    if @reservation.save

      redirect_to experience_reservation_path(@experience, @reservation), notice: 'Votre réservation a bien été enregistrée'
    else
      render "experiences/show", statut: :unprocessable_entity
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
