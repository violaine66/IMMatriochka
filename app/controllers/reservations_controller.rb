class ReservationsController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_reservation, only: [:edit, :update]


  def index
    if current_user.admin?
      @reservations = Reservation.all.order(created_at: :desc)
    else
      @reservations = current_user.reservations.order(created_at: :desc)
    end
  end


  def new
    @reservation = @experience.reservations.build
  end

  def create
    @reservation = @experience.reservations.build(reservation_params)
    @reservation.user = current_user
    @reservation.statut = 'en_attente' # Statut initial

    if @reservation.save
      mail = ConfirmationReservationMailer.with(reservation: @reservation, user: current_user).creation_confirmation
      mail.deliver_later
      redirect_to experiences_path, notice: 'Votre réservation a bien été enregistrée et attend la validation de l\'administrateur.'
    else
      render 'experiences/show', alert: 'Erreur lors de la création de la réservation.'
    end
  end

    # Action pour afficher le formulaire d'édition de la réservation
    def edit
      @reservation = Reservation.find(params[:id])

      # Aucune logique supplémentaire nécessaire pour le moment
    end

    # Action pour mettre à jour la réservation
    def update
      if current_user.admin? && @reservation.update(reservation_params)
        # On passe l'instance globale @reservation au mailer
        mail = ReservationStatusMailer.with(reservation: @reservation, user: current_user).status_updated
        mail.deliver_later # Envoi du mail en arrière-plan
        redirect_to reservations_path, notice: 'Le statut de la réservation a été mis à jour avec succès et email envoyé !'
      else
        render :edit, alert: 'Erreur lors de la mise à jour du statut.'
      end
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
