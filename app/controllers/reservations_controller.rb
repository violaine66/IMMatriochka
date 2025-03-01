class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @reservation = Reservation.new
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.experience = @experience
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new,  unprocessable_entity:
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_de_debut, :date_de_fin, :prix_total, :statut)
  end
end
